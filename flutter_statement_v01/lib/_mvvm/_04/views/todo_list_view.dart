import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/todo_list_view_model.dart';

class TodoListView extends ConsumerWidget {
  // 상태관리 ---> 동기화 (공유 데이터를 여러 화면에서 동일한 값을 보장)
  // 의존성 관리 <-- 강한 소유 관계 제거 가능
  TextEditingController _controller = TextEditingController();
  TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todoItem 객체는 상 태가 있다 즉 변수가 벼화할 가능성이 있따
    //todos ==> List<TodoItems
    final todos = ref.watch(TodoListViewModelProvider);
    // 창고에 직접 접급
    final todoNotifier = ref.read(TodoListViewModelProvider.notifier);
    print('object');

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
                    todoNotifier.addItem(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) {
                      todoNotifier.toggleItem(todo);
                    },
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
//
// class TodoListView extends StatefulWidget {
//   const TodoListView({super.key});
//
//   @override
//   State<TodoListView> createState() => _TodoListViewState();
// }
//
// class _TodoListViewState extends State<TodoListView> {
//   // 뷰는 뷰 모델만 바라보면 된다.
//   TextEditingController _controller = TextEditingController();
//
//   // 샘플 데이터
//   List<TodoItem> _todoItems = [
//     TodoItem(title: '플러터 공부'),
//     TodoItem(title: '낮잠 자기', isDone: true),
//     TodoItem(title: 'Shelfy 화면 구현'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Enter Todo Item',
//                 hintStyle: TextStyle(color: Colors.black26),
//                 suffix: IconButton(
//                   onPressed: () {
//                     // 추가로직 넣을 예정
//                     setState(() {
//                       _listViewModel.addItem(_controller.text);
//                       _controller.clear();
//                     });
//                   },
//                   icon: Icon(Icons.add),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _listViewModel.items.length,
//               itemBuilder: (context, index) {
//                 final todo = _listViewModel.items[index];
//                 return ListTile(
//                   leading: Checkbox(
//                     value: todo.isDone,
//                     onChanged: (value) {
//                       _listViewModel.toggleItem(todo);
//                       setState(() {});
//                     },
//                   ),
//                   title: Text(todo.title),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
