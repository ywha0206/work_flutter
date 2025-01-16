import 'package:flutter/material.dart';

import '../components/my_profile_buttons.dart';
import '../components/profile_buttons.dart';
import '../components/profile_count_info.dart';
import '../components/profile_header.dart';
import '../components/profile_tab_bar.dart';
import '../components/side_bar.dart';

// 페이지 단위의 위젯을 만들어 보자 --> 클래스로
// 우리들의 규칙 2 Scaffold
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
        ),
        endDrawer: SideBar(),
        body: Column(
          children: [
            const SizedBox(height: 20),
            ProfileHeader(),
            const SizedBox(height: 20),
            profileCountInfo(),
            const SizedBox(height: 20),
            // MyProfileButtons(),
            ProfileButtons(),
            Expanded(child: ProfileTab()),
          ],
        ),
      ),
    );
  }
}
