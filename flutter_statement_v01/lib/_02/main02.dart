import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 머터리얼 3 적용 방법
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: HomeScreen(),
    ),
  );
}
