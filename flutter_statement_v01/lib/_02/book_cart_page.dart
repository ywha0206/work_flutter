import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/model/book.dart';

class BookCartPage extends StatelessWidget {
  final List<Book> mySelectedBooks;
  const BookCartPage({required this.mySelectedBooks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: mySelectedBooks
            .map(
              (book) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        book.bookImg,
                        width: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(book.author),
                        Container(width: 260, child: Text(book.details)),
                        Text('ISBN  ${book.ISBN}'),
                        Text(
                          '\$ ${book.price}',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList());
  }
}
