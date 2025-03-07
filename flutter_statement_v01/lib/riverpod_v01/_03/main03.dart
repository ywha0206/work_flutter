import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/riverpod_v01/_03/book.dart';

import '../../common_utils/logger.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookPage(),
    );
  }
}

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.d('build 호출');
    String getBook = ref.watch(MyBookStoreProvider);
    logger.d(getBook);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('데이터 확인하자 : $getBook'),
            ElevatedButton(
              onPressed: () {
                ref.read(MyBookStoreProvider.notifier).changeData('밤으로의 긴 여로');
              },
              child: Text('클릭해바바'),
            )
          ],
        ),
      ),
    );
  }
}
