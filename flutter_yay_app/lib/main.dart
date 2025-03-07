import 'package:flutter/material.dart';
import 'package:flutter_yay_app/theme.dart';
import 'package:flutter_yay_app/yay_ui/screens/start_yay/login/login.dart';
import 'package:flutter_yay_app/yay_ui/screens/start_yay/register/register_page.dart';

import 'common/utils/logger.dart';
import 'yay_ui/screens/main_screen.dart';

void main() {
  runApp(YayoungUI());
}

class YayoungUI extends StatelessWidget {
  const YayoungUI({super.key});

  @override
  Widget build(BuildContext context) {
    print('============= print로 출력 ==============');
    logger.d('------------------- logger로 출력 -------------------');
    return MaterialApp(
      title: 'yayoung',
      debugShowCheckedModeBanner: false,
      theme: mTheme(),
      home: MainScreen(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => MainScreen(),
      },
    );
  }
}
