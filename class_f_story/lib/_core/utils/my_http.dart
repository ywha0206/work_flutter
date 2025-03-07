import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// API 서버의 기본 url 설정
// 집 기본 API 주소
// 그린 로컬 컴퓨터 기본 API 주소
// 전역변수
final baseUrl = 'http://192.168.0.33:8080';

final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    // 요청 데이터 형식을 json으로 지정
    contentType: 'application/json; charset=utf-8',
    // 필수! ---> dio는 200 상태코드 값이 아니면 무조건 오류로 발생
    // true로 설정시 다른 상태코드 값도 모두 허용
    validateStatus: (status) => true,
  ),
);

// 중요 데이터 보관소(금고 생성)
// 민감한 데이터를 보관하는 안전한 금고 역할
const secureStorage = FlutterSecureStorage();
