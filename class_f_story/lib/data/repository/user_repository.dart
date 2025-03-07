import 'dart:convert';

import 'package:class_f_story/_core/utils/logger.dart';
import 'package:dio/dio.dart';

import '../../_core/utils/my_http.dart';

class UserRepository {
  const UserRepository();

  // 회원가입 - 1단계
  // 통신 후 받은 데이터를 뷰모델로 던져야 함
  // Future<responseDTO> save(requestDTO) {}
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> reqData) async {
    // 전역변수 안에 옵션값 설정되어 있는 객체를 들고 옴
    Response response = await dio.post('/join', data: reqData);

    // 규칙 1 - Repository 영역에서는 응답 http를 전체를 받아서
    // 가능한 뷰 모델에 http body 영역만 던져주자
    // response.header, response.data <-- body
    Map<String, dynamic> responseBody = response.data;
    logger.e(responseBody);

    return responseBody;
  }

  // 사용자의 이름과 비밀번호 확인 요청
  // 레코드 문법으로 변환 Future<(타입1 , 타입 2)>
  Future<(Map<String, dynamic>, String)> readUser(
      Map<String, dynamic> reqData) async {
    Response response = await dio.post('/login', data: reqData);
    Map<String, dynamic> responseBody = response.data;

    // JWT
    String accessToken = '';

    // JWT 토큰 파싱
    try {
      logger.i('JWT 토큰 확인 : ${response.headers['Authorization']?[0]}');
      accessToken = response.headers['Authorization']![0];
    } catch (e) {
      logger.e('JWT 파싱 오류');
      // 모든 예외를 잡는다
    }
    // 레코드 문법 - 1. 위치 기반 레코드 문법, 2. 명명 기반 레코드 문법
    return (responseBody, accessToken);
  }

  // 로그인 요청 (레코드 문법)
  // 레코드 문법을 사용해보자. DTO 설계 없이 바로 리턴 () 괄호로 시작
  // dart 3.0 이상 부터 사용 가능
  // 그리고 보통 통신하는 코드에서 기본적으로 예외처리는 무조건 해야 한다.
  // 뷰 모델이 Repository 를 사용하는 구조
  Future<(Map<String, dynamic>, String)> findByUsernameAndPassword(
      Map<String, dynamic> reqData) async {
    // HTTP 응답 메세지 (이미지 화)
    Response response = await dio.post('/login', data: reqData);
    // 헤더 JWT 토큰 추출
    String accessToken = response.headers['Authorization']?[0] ?? '';
    logger.i(accessToken);
    Map<String, dynamic> responseBody = response.data; // HTTP 응답 메세지 바디
    return (responseBody, accessToken);
  }

  // 사용자 등록 요청
  Future<Map<String, dynamic>> save(Map<String, dynamic> reqData) async {
    Response response = await dio.post('/join', data: reqData);
    // 바디 추출
    Map<String, dynamic> responseBody =
        response.data; // header, body 중에 body 만 추출
    logger.i(responseBody);
    return responseBody;
  }

  // 자동 로그인
  // 매번 앱을 실행시 로그인 요청하는 것은 귀찮아
  // --> 서버 --> 인증 사용자 판별 --> 인증 -> JWT 토큰
  // 로그인 --> 로컬 --> JWT 토큰 (기기에서 토큰 꺼내서 다시 서버로 던져봐야 한다)
  Future<Map<String, dynamic>> loginWithToken(String accessToken) async {
    // (http 메세지) dio 헤더 설정하는 방법
    Response response = await dio.post(
      '/auto/login',
      options: Options(
        headers: {'Authorization': accessToken},
      ),
    );
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }
}
