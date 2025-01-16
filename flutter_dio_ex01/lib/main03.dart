import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 통신을 담당하는 클라이언트 측 객체를 가져오자
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    // 객체 실행시 한번 호출 메서드
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  // 통신을 담당하는 메서드를 만들어보자.
  _fetchTodos() async {
    // https://jsonplaceholder.typicode.com/todos/1
    // 통신을 담당하는 코드를 기본적으로 예외처리를 꼭 넣자
    try {
      Response resp =
          await _dio.get('https://jsonplaceholder.typicode.com/todos');
      print('HTTP status code : ${resp.statusCode}');
      print('서버측에서 전달한 데이터 : ${resp.data}');
      print('json 통신 후 dart에서는 어떤 타입? : ${resp.data.runtimeType}');

      // list 타입의 값을 출력하는 방법
      print('---------------------------------------------------------');
      Todo todo1 = Todo.fromJson(resp.data);
      print('todo1 : ${todo1}');
      print('---------------------------------------------------------');

      // List로 들고와서 담아보자
      // List<Todo> todos = List.generate(
      //   resp.data.length,
      //   (index) {
      //     return Todo(
      //         userId: resp.data['userId'],
      //         id: resp.data['id'],
      //         completed: resp.data['completed'],
      //         title: resp.data['title']);
      //   },
      // );
      // print(todos.toString());
    } catch (e) {
      print('실행 시점(runtime) 예외가 발생했어요.');
      print(e.toString());
    }
  }
}

class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  // dart 생성자 -> 명명된 생성자
  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}
