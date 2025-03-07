import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final bool isAvailable;
  final String name;

  Product({this.isAvailable = true, required this.name});

  // copyWith 메서드를 추가하기
  Product copyWith({String? name, bool? isAvailable}) {
    return Product(
      name: name ?? this.name,
      isAvailable: isAvailable ?? this.isAvailable,
      // stock: stock ?? this.stock,
    );
  }
}

// 창고 만들기  :: 창고 --> 뷰모델과 동일
class ProductNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    // 초기값 설정
    return [];
  }

  // addProduct(String name)
  void addProduct(String name) {
    state = [...state, Product(name: name)];
  }

  // 재고 여부 변경 toggleAvailable(int index)
  void toggleAvailable(int index) {
    state = state
        .map((item) =>
            index > 0 ? item.copyWith(isAvailable: !item.isAvailable) : item)
        .toList();
  }

// removeProduct(int index)
  void removeProduct(int index) {
    state = state
        .map((item) =>
            index > 0 ? item.copyWith(isAvailable: !item.isAvailable) : item)
        .toList();
  }
}

// 창고 관리자
final productProvider =
    NotifierProvider<ProductNotifier, List<Product>>(() => ProductNotifier());
