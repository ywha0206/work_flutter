import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

// viewModel 만들어 보자
class TodoListViewModel {
  List<TodoItem> _items = [];
  //getter
  List<TodoItem> get items => _items;

  // 비즈니스 로직
  void addItem(String title) {
    _items.add(TodoItem(title: title));
  }

  void toggleItem(TodoItem todo) {
    todo.isDone = !todo.isDone;
  }
}
