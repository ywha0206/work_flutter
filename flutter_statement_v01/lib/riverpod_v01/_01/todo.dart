import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final bool isCompleted;
  final String description;

  Todo({required this.isCompleted, required this.description});
}

// 코드를 분리해서 작성하는 습관 좋지만 너무 많으면 과할 수 있다
// 모델 클래서 프로바이더를 함께 코드를 작성해서 파일을 줄이자

// 프로바이더 - 제공자
// 비유 : 창고관리자 (1회 알바생) - 데이터 제공자 역할
final todoProvider = Provider<Todo>(
  (ref) => Todo(isCompleted: true, description: '상태관리 배우기'),
);
