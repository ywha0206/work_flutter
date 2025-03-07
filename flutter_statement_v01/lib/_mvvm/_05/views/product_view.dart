import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

import '../product.dart';

class ProductView extends ConsumerWidget {
  TextEditingController _controller = TextEditingController();
  ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todoItem 객체는 상 태가 있다 즉 변수가 벼화할 가능성이 있따
    //todos ==> List<TodoItems
    final products = ref.watch(productProvider);
    // 창고에 직접 접급
    final productNotifier = ref.read(productProvider.notifier);
    print('object');

    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Todo Item',
                hintStyle: TextStyle(color: Colors.black26),
                suffix: IconButton(
                  onPressed: () {
                    // add 아이템
                    productNotifier.addProduct(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // SpinBox(),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  // leading: Checkbox(
                  //   value: products.isAvial,
                  //   onChanged: (value) {
                  //     // 토글 변경
                  //   },
                  // ),
                  title: Text(
                    product.name,
                  ),
                  subtitle: Text(product.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
