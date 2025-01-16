void main() {
  String? userName = getNullableUserName(name: 'kjilj');
  int? userNameLength = userName?.length;

  print('사용자 이름 길이 : ${userNameLength}');
  print('====================================');

  String finalUserName = userName ?? '김철학';
  print('finalUserName : ${finalUserName}');

  String upperOrNoName = userName?.toUpperCase() ?? 'NO_NAME';
  print('upperOrNoName : ${upperOrNoName}');
}

String? getNullableUserName({String? name}) {
  return name;
}
