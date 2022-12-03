import 'package:objectbox/objectbox.dart';

@Entity()
class ShoppingMemo {

  int id = 0;

  String memo;

  bool check = false;

  ShoppingMemo({
    required this.memo,
    required this.check
  });
}