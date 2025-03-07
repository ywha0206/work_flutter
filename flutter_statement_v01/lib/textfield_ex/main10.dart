import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text Editing Controller 사용하여 텍스트 필드의 입력값을 제어
  final username = TextEditingController();
  final password = TextEditingController();
  final scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 700,
                  ),
                  // const SizedBox(height: 16),
                  TextFormField(
                    onTap: () {
                      print('username textfield');

                      // 스크롤 최하단으로 이동
                      Future.delayed(Duration(seconds: 2));
                      scroll.jumpTo(scroll.position.maxScrollExtent);
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onTap: () {
                      print('password textfield');
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('login')),
            ),
          ],
        ),
      ),
    );
  }
}
