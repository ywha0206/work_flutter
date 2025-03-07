import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yay_app/common/utils/logger.dart';

import '../../../../theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/images/yay_logo.png',
                width: 220,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _buildLoginButton2('카카오로 로그인',
                      CupertinoIcons.chat_bubble_fill, 20.0, context),
                  const SizedBox(height: 15.0),
                  _buildLoginButton2('Apple로 로그인', Icons.apple, 30.0, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(String title, IconData mIcon, double size) {
    return Container(
      height: 70,
      child: Row(
        children: [
          SizedBox(
            width: 70.0,
            child: Icon(
              mIcon,
              size: size,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: textTheme().bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _buildLoginButton2(
      String title, IconData mIcon, double size, BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(vertical: 4),
      tileColor: Colors.grey[100],
      onTap: () {
        logger.d('클릭함');
        Navigator.pushNamed(context, '/register');
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        title,
        style: textTheme().bodyLarge,
        textAlign: TextAlign.center,
      ),
      leading: SizedBox(
        width: 40,
        child: Icon(
          mIcon,
          size: size,
        ),
      ),
    );
  }
}
