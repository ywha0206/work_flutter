import 'package:flutter/material.dart';
import 'package:flutter_login_app/component/custom_form.dart';
import 'package:flutter_login_app/component/logo.dart';
import 'package:flutter_login_app/size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        // 여백 확보를 위한 ListView 선언
        child: ListView(
          children: [
            SizedBox(height: xlargeGap),
            Logo('Login'),
            SizedBox(height: largeGap),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
