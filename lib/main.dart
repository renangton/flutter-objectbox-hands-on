import 'package:flutter/material.dart';
import 'package:flutter_objectbox_hands_on/view/ShoppingMemoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: const ShoppingMemoPage()
    );
  }
}
