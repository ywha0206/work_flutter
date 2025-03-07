import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yay_app/theme.dart';
import 'package:flutter_yay_app/yay_ui/screens/home/components/home_button.dart';
import 'package:flutter_yay_app/yay_ui/screens/home/components/home_feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeFeed(),
        HomeButton(),
      ],
    );
  }
}
