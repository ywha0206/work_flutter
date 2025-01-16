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
      home: Scaffold(
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 27,
          //그리드의 열 개수를 고정하는 속성입니다
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blueAccent,
              child: Center(child: Text('${index}')),
            );
          },
        ),
      ),
    );
  }
}
