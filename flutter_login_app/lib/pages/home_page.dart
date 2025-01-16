import 'package:flutter/material.dart';
import 'package:flutter_login_app/component/logo.dart';
import 'package:flutter_login_app/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: xlargeGap),
            SizedBox(height: xlargeGap),
            Logo('Care Soft'),
            SizedBox(height: largeGap),
            SizedBox(height: largeGap),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    // 1. 화면 스택 제거
                    Navigator.pop(context);
                  },
                  child: Text('Get Started')),
            )
          ],
        ),
      ),
    );
  }
}
