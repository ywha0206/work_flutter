import 'package:class_f_story/_core/constants/size.dart';
import 'package:class_f_story/data/gvm/session_gvm.dart';
import 'package:class_f_story/ui/pages/auth/join_page/join_page.dart';
import 'package:class_f_story/ui/widgets/custom_auth_text_form_field.dart';
import 'package:class_f_story/ui/widgets/custom_elevated_button.dart';
import 'package:class_f_story/ui/widgets/custom_logo.dart';
import 'package:class_f_story/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginBody extends ConsumerWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // 컴파일 시점이 아니라 런타임 시점에서 만들어지기 때문에
  // const를 지운 constructure로 만든다
  LoginBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 창고 자체에 접근하는 코드 --> 뷰모델 가지고 옴
    SessionGvm gvm = ref.read(sessionProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CustomLogo('f-story'),
          CustomAuthTextFormField(
            text: 'Username',
            controller: _usernameController,
          ),
          const SizedBox(height: largeGap),
          CustomAuthTextFormField(
            text: 'Password',
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: '로그인',
            click: () {
              gvm.login(_usernameController.text.trim(),
                  _passwordController.text.trim());
            },
          ),
          CustomTextButton(
              text: '회원가입 페이지로 이동',
              click: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => JoinPage()));
              }),
        ],
      ),
    );
  }
}
