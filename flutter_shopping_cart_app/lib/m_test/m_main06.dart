void main() async {
  await divideNum(50, 13).then(
    (value) => print('결과 출력 ${value}'),
  );
  print('main 함수 종료');
}

Future<double> divideNum(double n1, double n2) {
  return Future.delayed(
    Duration(seconds: 3),
    () => n1 / n2,
  );
}
