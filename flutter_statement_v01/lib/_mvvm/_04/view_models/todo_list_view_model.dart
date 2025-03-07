import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_item.dart';

// viewModel
// 1. 뷰모델을 사용하고 있다.
// 2. 뷰모델에 날개를 달아 주자 (riverpod 상태 관리 기능 추가)
// 3. 뷰 모델이 창고의 역할도 합니다. - 우리들의 규칙
// get, set 사용하지 말자
class TodoListViewModel extends Notifier<List<TodoItem>> {
  // List<TodoItem> _items = [];

  @override
  List<TodoItem> build() {
    return [];
  }

  // 비즈니스 로직
  void addItem(String title) {
    // state.add <-- 원래 사용하고 있는 객체에 접근해서 추가했더니
    // 위젯 변경이 안 됨 but 새로운 객체를 만들어 할당하니 위젯 변경이 일어남
    state = [...state, TodoItem(title: title)];
  }

  // 0. 가변 객체를 변경해서 사용하는 코드
  // void toggleItem(TodoItem todo){
  //   todo.isDone = !todo.isDone;
  // }

  // 상태관리를 다룰 때 불변 객체와 가변객체란?
  // 1단계 코드
  // void toggleItem(TodoItem todo) {
  //   state = [
  //     for (final item in state)
  //       if (item == todo)
  //         TodoItem(title: item.title, isDone: !item.isDone)
  //       else
  //         item
  //   ];
  // }

  // 2단계 코드
  void toggleItem(TodoItem todo) {
    state = state
        .map(
            (item) => item == todo ? item.copyWith(isDone: !item.isDone) : item)
        .toList();
  }

  // 불변성 원칙 위배(버그 위험 증가)
  // 기존 리스트의 참조를 유지한 채,
  // 리스트 안에 특정 객체의 속성을 직접 수정하는 것
  // flutter 상태 관리에서는 가변 객체 대신 불변객체를 사용한다.
}

// 3. 창고 관리자 만들고

final TodoListViewModelProvider =
    NotifierProvider<TodoListViewModel, List<TodoItem>>(
  () {
    return TodoListViewModel();
  },
);
