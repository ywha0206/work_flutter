import 'package:flutter/material.dart';

import '../model/book.dart';

class BookListPage extends StatelessWidget {
  final Function(String) onToggleSaved;
  final List<Book> books;

  // 부모위젯으로부터 넘겨받은 장바구니 데이터 (cart 목록)
  final List<String> selectedBook;
  BookListPage(
      {required this.onToggleSaved,
      required this.books,
      required this.selectedBook,
      super.key});

  // 임시 데이터  - 교보문고에 볼 수 있는 책 목록 리스트

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: books.map(
        // book <-- books에 0번째 인덱스는 'Flutter for Beginners'
        (book) {
          // 함수 바디에는 식을 작성할 수 있다.
          // 장바구니 유무를 어떻게 확인하지?
          // 부모가 관리하는 장바구니 데이터에 book이란 데이터가
          // 있는가 없는가 체크하고자 한다면?
          final isSelectedBook = selectedBook.contains(book.title);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    book.bookImg,
                    width: 80,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(book.author),
                    Container(width: 210, child: Text(book.details)),
                    Text('ISBN  ${book.ISBN}'),
                    Text(
                      '\$ ${book.price}',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      // 부모에게 콜백을 호출하는데 데이터도 함께 전달시킨다.
                      onToggleSaved(book.title);
                    },
                    icon: Icon(
                      isSelectedBook ? Icons.remove_circle : Icons.add_circle,
                      color: isSelectedBook ? Colors.red : Colors.green,
                    )),
              ],
            ),
          );
          //   ListTile(
          //   leading: Container(
          //     width: 40,
          //     height: 80,
          //     child: Image.network(book.bookImg),
          //   ),
          //   title: Text(book.title),
          //   subtitle: Text(book.details),
          //   trailing: IconButton(
          //       onPressed: () {
          //         // 부모에게 콜백을 호출하는데 데이터도 함께 전달시킨다.
          //         onToggleSaved(book.title);
          //       },
          //       icon: Icon(
          //         isSelectedBook ? Icons.remove_circle : Icons.add_circle,
          //         color: isSelectedBook ? Colors.red : Colors.green,
          //       )),
          // );
        },
      ).toList(),
    );
  }
}
