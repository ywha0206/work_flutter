import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_02/book_cart_page.dart';
import 'package:flutter_statement_v01/_02/book_list_page.dart';
import 'package:flutter_statement_v01/model/book.dart';

import '../common_utils/logger.dart';

// 상태가 있는 위젯
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 로컬상태 : 하단에 활동회 된 탭 인덱스 번호
  int pageIndex = 0;

  // 공유상태 : 카트에 담긴 책 정보 (책 리스트 화면, 장바구니 화면에서 공유하는 데이터)
  // 상품 --> 책(String) 데이터 타입으로 관리하자
  List<String> mySelectedBook = [];

  // 상태를 변경하는 메서드 만들기
  void _toggleSaveStatus(String book) {
    // 다시 화면을 그려라 요청
    setState(() {
      if (mySelectedBook.contains(book)) {
        mySelectedBook.remove(book);
      } else {
        mySelectedBook.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d('homa screen build 메서드 호출 됨');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '연서',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                '  연화의 서재',
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              )
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        body: IndexedStack(
          // 반드시 추가해야 하는 속성
          index: pageIndex,
          children: [
            BookListPage(
              books: bookList,
              onToggleSaved: _toggleSaveStatus,
              selectedBook: mySelectedBook,
            ),
            BookCartPage(
              mySelectedBooks: bookList.where((book) {
                return mySelectedBook.contains(book.title);
              }).toList(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (index) {
            // 행위 만들어줘야 하는데 축약함
            setState(() {
              pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Books',
              icon: Icon(CupertinoIcons.book),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(CupertinoIcons.cart),
            ),
          ],
        ),
      ),
    );
  }
}
