import 'package:flutter/material.dart';
import 'package:flutter_list_grid_page/main.dart';

//ListView 와 ListTile 위젯을 살펴보자
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
        body: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item1'),
              subtitle: Text('item1 sub description'),
              trailing: IconButton(
                onPressed: () {
                  print('item1 클릭했어요');
                },
                icon: Icon(Icons.more_horiz),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('2'),
              ),
              title: Text('item2'),
              subtitle: Text('item2 sub description'),
              trailing: IconButton(
                onPressed: () {
                  print('item2 클릭했어요');
                },
                icon: Icon(Icons.more_horiz),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('3'),
              ),
              title: Text('item3'),
              subtitle: Text('item3 sub description'),
              trailing: IconButton(
                onPressed: () {
                  print('item3 클릭했어요');
                },
                icon: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
