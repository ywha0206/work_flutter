import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yay_app/yay_ui/screens/camping/camping_page.dart';
import 'package:flutter_yay_app/yay_ui/screens/home/home_page.dart';
import 'package:flutter_yay_app/yay_ui/screens/my_page/my_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void changeStackPages(int index) {
    setState(() {
      _selectedIndex = index; // 탭 변경시 상태 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: _selectedIndex == 1 ? true : false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              HomeAppBar(),
              CampingAppBar(),
              MyAppBar(),
            ],
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomePage(),
            CampingPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  AppBar HomeAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/yay_logo.png',
            width: 170,
          ),
          Text('#캠핑을 위한 모든 것, 야영에서 함께'),
        ],
      ),
      actions: [
        SizedBox(
          width: 60,
          child: Icon(
            CupertinoIcons.search,
            size: 30,
          ),
        )
      ],
      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 14.0),
      toolbarHeight: 80,
    );
  }

  AppBar CampingAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        '캠핑장',
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        SizedBox(
          width: 60,
          child: Icon(
            CupertinoIcons.search,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Me',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      ),
      actions: [SizedBox(width: 60, child: Icon(Icons.settings))],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        changeStackPages(index);
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home_filled,
            size: 35,
          ),
        ),
        BottomNavigationBarItem(
          label: 'null',
          icon: Icon(
            CupertinoIcons.location_solid,
            size: 35,
          ),
        ),
        BottomNavigationBarItem(
          label: 'My',
          icon: Icon(
            CupertinoIcons.person_fill,
            size: 35,
          ),
        ),
      ],
    );
  }
}
