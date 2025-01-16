import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_grid_page/m_grid/grid_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildRecipeAppBar(),
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 12,
          //그리드의 열 개수를 고정하는 속성입니다
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridItem(index),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildRecipeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: Container(
            color: Colors.black12,
            height: 1.0,
          )),
      shape: Border(
        bottom: BorderSide(color: Colors.black12, width: 1),
      ),
      title: Text('고양이 귀엽지'),
      iconTheme: IconThemeData(color: Colors.black),
      // elevation: 1.0,
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.red),
        SizedBox(width: 15)
      ],
    );
  }
}
