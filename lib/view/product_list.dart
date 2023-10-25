import 'package:flutter/material.dart';

import '../models/product.dart';
import '../view_models/my_cart_view_model.dart';
import '../view_models/product_list_view_model.dart';

class ProductList extends StatefulWidget {
  final ProductListViewModel productVm;
  final MyCartViewModel myCartVm;

  ProductList({required this.productVm, required this.myCartVm, super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}

// StatefulWidget 으로 변경 -> 상위 클래스, 하위 클래스가 존재
// 하위 클래스에서 -> 상위 클래스에 접근하기 위해 widget을 참조 변수를 제공
// 즉 widget은 StatefulWidget 클래스의 인스턴스를 참조하며, 이를 통해 부모 위젯으로 부터 데이터를 전달 받거나 부모 위젯에 메서드를 호출할 수 있다
class _ProductListState extends State<ProductList> {
 // DI 외부에서 생성자를 통해서 데이터를 주입
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return ListTile(
        leading: Text('${widget.productVm.products[index].productId}'),
        title: Text('${widget.productVm.products[index].productName}'),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            setState(() {
              widget.myCartVm.addProduct(widget.productVm.products[index]);
            });
          },
        ),
      );
    }, itemCount: widget.productVm.products.length);
  }
}
