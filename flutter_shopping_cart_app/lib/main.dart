import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_app/components/shopping_cart_body.dart';
import 'package:flutter_shopping_cart_app/components/shopping_cart_header.dart';
import 'package:flutter_shopping_cart_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mTheme(),
      home: ShoppingCartPage(),
    );
  }
}

// 여기는 페이지
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ShoppingCartHeader(),
          ShoppingCartBody(),
        ],
      ),
    ));
  }

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}
