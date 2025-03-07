import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_03/inherited_parent.dart';
import 'package:flutter_statement_v01/model/book.dart';

class BookCartPage extends StatelessWidget {
  const BookCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    InheritedParent inheritedParent =
        // ! 널이 절대 아님을 우리는 알고 있다.
        context.dependOnInheritedWidgetOfExactType<InheritedParent>()!;
    return ListView(
        children: inheritedParent.state
            .map((book) => ListTile(title: Text(book)))
            .toList());
  }
}
