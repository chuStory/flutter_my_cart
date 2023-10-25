import 'package:class_my_cart/view/my_cart.dart';
import 'package:class_my_cart/view/product_list.dart';
import 'package:class_my_cart/view_models/my_cart_view_model.dart';
import 'package:class_my_cart/view_models/product_list_view_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ProductListViewModel productVm = ProductListViewModel();
  final MyCartViewModel cartVm = MyCartViewModel();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(cartVm),
          body: IndexedStack(
            index: _index,
            children: [
              ProductList(productVm: productVm, myCartVm: cartVm),
              MyCart(myCartVm: cartVm),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: '상품'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '장바구니'),
            ],
            currentIndex: _index,
            onTap: (newIndex) {
              setState(() {
                _index = newIndex;
              });
            },
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(MyCartViewModel myCartVm) {
  return AppBar(
    title: const Text('teco 쇼핑'),
    actions: [
      Center(
        child: Stack(
          children: [
            const Icon(Icons.shopping_cart),
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.redAccent,
                child: Text('${myCartVm.items.length}'),
              ),
            )
          ],
        ),
      ),
      const SizedBox(width: 16),
    ],
  );
}