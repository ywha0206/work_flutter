import 'package:class_f_story/_core/constants/theme.dart';
import 'package:class_f_story/ui/pages/auth/join_page/join_page.dart';
import 'package:class_f_story/ui/pages/auth/login_page/login_page.dart';
import 'package:class_f_story/ui/pages/post/list_page/post_list_page.dart';
import 'package:class_f_story/ui/pages/post/write_page/post_write_page.dart';
import 'package:class_f_story/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// 사전기반 --> navigator : 화면 전환을 관리하는 객체 --> stack 구조로 화면을 관리한다.
// 화면 이동 순서에 따라 네비게이터가 스택 구조를 관리함
GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
// 고유키를 생성 (GlobalKey) -> 모든 위젯은 고유값을 식별하기 위해 키를 가질 수 있다.
// 전역변수로 navigatorkey 선언 -> Navigator 관리 상태에 전역적으로 접근이 가능
// 현재 가장 위에 있는 context를 알아낼 수 있습니다.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // context가 없는 곳에서 context를 사용할 수 있게 하는 방법
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      // initialRoute: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/join": (context) => JoinPage(),
        "/post/list": (context) => PostListPage(),
        "/post/write": (context) => PostWritePage(),
      },
      theme: theme(),
    );
  }
}
