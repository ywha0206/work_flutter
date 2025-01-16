import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('pageView'),
        ),
        body: PageView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          controller: PageController(
            initialPage: 0,
            viewportFraction: 0.4,
          ),
          itemBuilder: (context, index) {
            return Container(
              child: Center(child: Text('#fffeee')),
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            );
          },
        ),
      )),
    );
  }
}
