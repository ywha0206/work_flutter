// model
class TodoItem {
  String title;
  String? subTitle;
  bool isDone;

  TodoItem({required this.title, this.isDone = false, this.subTitle});

  // 2단계 코드 시작
  TodoItem copyWith({String? title, bool? isDone}) {
    return TodoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
