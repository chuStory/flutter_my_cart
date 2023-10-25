import '../models/product.dart';

class MyCartViewModel {

  // 데이터 상태 값
  List<Product> _items = [];
  List<Product> get items => _items;

  // 아이템 등록 기능
  void addProduct(Product product) {
    _items.add(product);
  }

  // 아이템 제거 기능
void removeProduct(Product product) {
    _items.remove(product);
  }
}