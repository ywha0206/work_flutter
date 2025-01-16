import 'package:flutter/material.dart';
import 'package:flutter_login_app/pages/home_page.dart';
import 'package:flutter_login_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            minimumSize: Size(400, 60),
          ),
        ),
      ),
      initialRoute: '/login',
      // 앱에서 사용할 화면(경로)를 미리 설정할 수 있다.
      // map 리터럴은 {} 중괄호로 표현, 배열은 [] 대괄호
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
