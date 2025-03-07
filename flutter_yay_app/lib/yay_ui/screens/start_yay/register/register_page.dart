import 'package:flutter/material.dart';
import 'package:flutter_yay_app/theme.dart';
import 'package:flutter_yay_app/yay_ui/screens/start_yay/register/components/custom_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100.0),
            Text(
              '야영에서 사용할',
              style: textTheme().bodyLarge,
            ),
            Text(
              '닉네임을 입력해 주세요',
              style: textTheme().bodyLarge,
            ),
            const SizedBox(height: 50.0),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
