import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  TextEditingController _controller = TextEditingController();

  // 샘플 데이터
  List<TodoItem> _todoItems = [
    TodoItem(title: '플러터 공부'),
    TodoItem(title: '낮잠 자기', isDone: true),
    TodoItem(title: 'Shelfy 화면 구현'),
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Todo Item',
                hintStyle: TextStyle(color: Colors.black26),
                suffix: IconButton(
                  onPressed: () {
                    // 추가로직 넣을 예정
                    setState(() {
                      _todoItems.add(TodoItem(title: _controller.text));
                      _controller.clear();
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                final todo = _todoItems[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) {
                      // todo.isDone --> true, false
                      // todo.isDone = value ?? false;
                      todo.isDone = !todo.isDone;
                      setState(() {});
                    },
                  ),
                  title: Text(todo.title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
