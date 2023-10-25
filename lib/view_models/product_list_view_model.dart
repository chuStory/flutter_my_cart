import '../models/product.dart';

class ProductListViewModel {
  // 샘플 데이터 --> view_model로 옮길 예정 (통신)
  List<Product> _productList = List.generate(100, (index) => Product("p_${index}", '상품 ${index}', 1000));

  List<Product> get products => _productList;
}