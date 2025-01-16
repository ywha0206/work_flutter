import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'recipe_list_item.dart';
import 'recipe_menu.dart';
import 'recipe_title.dart';

// 플러터 코드의 시작점
void main() {
  // MyApp 위젯을 루트 위젯으로 만들어 주는 함수
  // 사전 기반 지식 ---. 위젯 트리를 떠올려 주세요
  runApp(const MyApp());
}

// 위젯을 만들 때 크게 두 가지로 구분한다
// statelessWidget 위젯은 상태 변경이 없는 위켓을 화면에 그릴 때 선택

// 상속 문법 사용
// 우리들만의 약속 - MyApp -> 머터리얼 앱이라는 객체를 활용하자
class MyApp extends StatelessWidget {
  // 생성자 - 선택적 명명 매개변수 (값을 넣어도 되고 안 넣어도 되고)
  const MyApp({super.key});

  // 보통 루트 위젯을 시작할 때 머터리얼 앱을 많이 활용한다
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PatuaOne'),
      // 앱이 실행되었을 때 첫 페이지를 지정할 수 있다
      home: RecipePage(),
    );
  }
} // end of class

// 우리들만의 규칙 2 - 페이지라고 이름 붙이는 클래스는 스캐아 폴더를 활용하자
class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 시각적 레이아웃 구조를 잡아주는 위젯
    // app 영역
    // body 영역
    // bottom 영역
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              RecipeTitle(),
              RecipeMenu(),
              RecipeListItem('coffee', 'Made Coffee'),
              RecipeListItem('burger', 'Made Burger'),
              RecipeListItem('pizza', 'Made Pizza'),
            ],
          ),
        ),
      ),
    );
  }

  // 메서드를 만들어 보자
  // private
  AppBar _buildRecipeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          )),
      shape: Border(
        bottom: BorderSide(color: Colors.black12, width: 1),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      // elevation: 1.0,
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.red),
        SizedBox(width: 15)
      ],
    );
  }
}
