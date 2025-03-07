import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 로컬 상태 관리 ->
class PostListBodyTemp extends StatefulWidget {
  const PostListBodyTemp({super.key});

  @override
  State<PostListBodyTemp> createState() => _PostListBodyTempState();
}

class _PostListBodyTempState extends State<PostListBodyTemp> {
  // 사용자가 당기기, 사용자가 밑에서 올리기
  // 거기에 맞는 콜백 이벤트 메서드를 호출해야 사용이 가능하다.
  // refreshCompleted() <-- 새로고침 완료 후 호출하는 메서드
  // loadCompleted() <-- 추가 데이터 로드 완료 후 호출
  RefreshController _refreshController = RefreshController();

  // 샘플 데이터
  List<Map<String, dynamic>> _posts = [
    {'id': 1, 'title': '1번째 게시물', 'content': '내용 내용 1'},
    {'id': 2, 'title': '2번째 게시물', 'content': '내용 내용 2'},
    {'id': 3, 'title': '3번째 게시물', 'content': '내용 내용 3'},
    {'id': 4, 'title': '4번째 게시물', 'content': '내용 내용 4'},
    {'id': 5, 'title': '5번째 게시물', 'content': '내용 내용 5'},
    {'id': 6, 'title': '6번째 게시물', 'content': '내용 내용 6'},
    {'id': 7, 'title': '7번째 게시물', 'content': '내용 내용 7'},
    {'id': 8, 'title': '8번째 게시물', 'content': '내용 내용 8'},
    {'id': 9, 'title': '9번째 게시물', 'content': '내용 내용 9'},
    {'id': 10, 'title': '10번째 게시물', 'content': '내용 내용 10'},
    {'id': 11, 'title': '11번째 게시물', 'content': '내용 내용 11'},
    {'id': 12, 'title': '12번째 게시물', 'content': '내용 내용 12'},
    {'id': 13, 'title': '13번째 게시물', 'content': '내용 내용 13'},
  ];

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true, // 사용자가 아래에서 위로 끌어올리는 행위 허용
      onLoading: _onLoading,
      enablePullDown: true, // 사용자가 위에서 아래로 당기는 행위 허용
      // onRefresh: () {
      //   _refreshController.refreshCompleted();
      // },
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_posts[index]['title']),
            subtitle: Text(_posts[index]['content']),
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    // 통신 가정
    await Future.delayed(Duration(seconds: 1));
    // 데이터가 새로 들어옴
    setState(() {
      _posts = [
        ..._posts,
        {'id': 14, 'title': '리프레쉬 14번째 게시물', 'content': '내용 내용 14'},
        {'id': 15, 'title': '리프레쉬 15번째 게시물', 'content': '내용 내용 15'},
        {'id': 16, 'title': '리프레쉬 16번째 게시물', 'content': '내용 내용 16'},
        {'id': 17, 'title': '리프레쉬 17번째 게시물', 'content': '내용 내용 17'},
      ];
    });
    _refreshController.refreshCompleted();
  }

  // 페이징 동작 처리 (무한 스크롤)
  // 사용자가 리스트를 맨 아래로 스크롤할 때 이벤트 리스너 동작
  // 새로운 데이터를 api 호출해서 상태 갱신을 해주어야 한다.
  Future<void> _onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // 기존 있던 데이터에 추가로 값을 넣어서 화면 갱신
      // 기존의 데이터 타입 -- 통으로 List
      // 새로운 api 호출 시 ---> 10개의 데이터 리스트
      // 기존 리스트 + 새로운 리스트 하는 방법
      // _posts = _posts + [];
      _posts.addAll([
        {'id': 45, 'title': '로딩 45번째 게시물', 'content': '내용 내용 14'},
        {'id': 46, 'title': '로딩 46번째 게시물', 'content': '내용 내용 15'},
        {'id': 47, 'title': '로딩 47번째 게시물', 'content': '내용 내용 16'},
        {'id': 48, 'title': '로딩 48번째 게시물', 'content': '내용 내용 17'},
      ]);
    });
    _refreshController.loadComplete();
  }

  // 화면이 종료될 때 호출되는 생명주기를 가지고 있다
  // 스트림이 내부적으로 동작함
  // _refreshController 위젯이 제거될 때 메모리에서 해제해야 함
  // 왜? 메모리 릭이 발생할 수 있다(메모리 누수)
  @override
  void dispose() {
    _refreshController.dispose(); // 메모리 해제
    super.dispose();
  }
  // 해제 안 하면 화면을 이동해도 리스너가 계속 실행됨
  // 중첩되면 메모리가 점점 증가하면서 앱이 느려짐
}
