import 'package:flutter/material.dart';
import 'package:flutter_objectbox_hands_on/objectbox.g.dart';

import 'ShoppingMemoPage.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // ObjectBoxの利用にstoreが必要
  Store? store;

  // 投稿後の内容を削除するためのもの
  final controller = TextEditingController();

  // ToDo 要修正
  List<String> sampleList = ["hoge", "fuga", "piyo"];

  Future<void> initialize() async {
    // storeの作成にopenStore()という非同期関数の実行が必要
    store = await openStore();
  }

  // この関数の中の処理は初回に一度だけ実行される
  @override
  void initState() {
    super.initState();
    initialize();
  }

  // controllerを使う時はdisposeが必要
  @override
  void dispose() {
    super.dispose();
    store?.close();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "ToDoリスト",
          style: TextStyle(fontSize: 32, color: Colors.amber[300]),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 28),
            onPressed: () {
              store?.close();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ShoppingMemoPage()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sampleList.length,
              itemBuilder: (context, index) {
                final sample = sampleList[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // ToDoリストの内容を表示
                      Expanded(
                        child: Text(
                          sample,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                      // ToDoリストの削除
                      IconButton(
                        onPressed: () {
                          // ToDo ToDoリストの削除処理を実装
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
                hintText: 'ToDoリスト追加',
                fillColor: Colors.blue[500],
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
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
                // ToDo ToDoリストの登録処理を実装
                controller.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
