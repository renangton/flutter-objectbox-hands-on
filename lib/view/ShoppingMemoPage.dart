import 'package:flutter/material.dart';
import 'package:flutter_objectbox_hands_on/model/ShoppingMemo.dart';
import 'package:flutter_objectbox_hands_on/objectbox.g.dart';

class ShoppingMemoPage extends StatefulWidget {
  const ShoppingMemoPage({Key? key}) : super(key: key);

  @override
  State<ShoppingMemoPage> createState() => _ShoppingMemoPageState();
}

class _ShoppingMemoPageState extends State<ShoppingMemoPage> {
  // ObjectBoxの利用にstoreが必要
  Store? store;
  Box<ShoppingMemo>? shoppingMemoBox;
  List<ShoppingMemo> shoppingMemoList = [];

  // 投稿後の内容を削除するためのもの
  final controller = TextEditingController();

  Future<void> initialize() async {
    // storeの作成にopenStore()という非同期関数の実行が必要
    store = await openStore();
    shoppingMemoBox = store?.box<ShoppingMemo>();
    fetchShoppingMemoList();
  }

  // この関数の中の処理は初回に一度だけ実行される
  @override
  void initState() {
    super.initState();
    initialize();
  }

  // BoxからShoppingMemo一覧を取得
  void fetchShoppingMemoList() {
    shoppingMemoList = shoppingMemoBox?.getAll() ?? [];
    setState(() {});
  }

  // controllerを使う時はdisposeが必要
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "買い物リスト",
          style: TextStyle(fontSize: 32, color: Colors.amber[300]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoppingMemoList.length,
              itemBuilder: (context, index) {
                final shoppingMemo = shoppingMemoList[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // チェックボックスの表示
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          activeColor: Colors.blue,
                          value: shoppingMemo.check,
                          onChanged: (bool? checkBoxState) {
                            shoppingMemo.check = checkBoxState!;
                            shoppingMemoBox?.put(shoppingMemo);
                            fetchShoppingMemoList();
                          },
                        ),
                      ),
                      // 買い物リストの内容を表示
                      Expanded(
                        child: Text(
                          shoppingMemo.memo,
                          style: TextStyle(fontSize: 28, color: shoppingMemo.check ? Colors.grey : Colors.black),
                        ),
                      ),
                      // 買い物リストの削除
                      IconButton(
                        onPressed: () {
                          shoppingMemoBox?.remove(shoppingMemo.id);
                          fetchShoppingMemoList();
                        },
                        icon: const Icon(Icons.delete, size: 28),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '買い物リスト追加',
                fillColor: Colors.green[200],
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
              ),
              onFieldSubmitted: (text) {
                if (text != "") {
                  final newShoppingMemo = ShoppingMemo(memo: text, check: false);
                  shoppingMemoBox?.put(newShoppingMemo);
                  fetchShoppingMemoList();
                }
                controller.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
