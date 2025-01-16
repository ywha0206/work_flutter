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
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text('${index + 1}'),
                ),
                title: Text('item ${index + 1}'),
                subtitle: Text('Item sub ${index + 1}'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey,
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.0,
                height: 20.0,
              );
            },
            itemCount: 20),
      ),
    );
  }
}
