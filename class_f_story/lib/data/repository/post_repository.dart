import 'package:class_f_story/_core/utils/my_http.dart';
import 'package:dio/dio.dart';

class PostRepository {
  const PostRepository(); // const 쓰는 이유 여러 객체 만들 필요 없어서 하나만 만들어서 공유

  // 게시글 목록 조회
  /// - [page] : 조회할 페이지 번호 (기본값 0)
  /// - return : 서버로부터 받은 게시글 목록(map)
  Future<Map<String, dynamic>> findAll({int page = 0}) async {
    // List -> [];  Map  -> {};
    Response response =
        await dio.get('/api/post', queryParameters: {'page': page});

    // http 전체 응답 메세지에서 바디 부분만 추출해서 뷰모델로 리턴시키자
    // response.headers;
    // map 구조로 다운캐스팅을 하고 뷰모델로 던져줄 예정
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 상세 조회
  // findById
  Future<Map<String, dynamic>> findById({required int id}) async {
    Response response = await dio.get('/api/post/${id}');
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 삭제
  // delete
  Future<Map<String, dynamic>> delete({required int id}) async {
    Response response = await dio.delete('/api/post/${id}');
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 생성
  // save
  Future<Map<String, dynamic>> save(Map<String, dynamic> reqData) async {
    Response response = await dio.post('/api/post', data: reqData);
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 수정
  // update
  Future<Map<String, dynamic>> update(
      {required Map<String, dynamic> reqData, required int id}) async {
    Response response = await dio.put('/api/post/${id}', data: reqData);
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }
}
