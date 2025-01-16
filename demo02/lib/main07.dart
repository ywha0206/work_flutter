// 논리 연산자
void main() {
  bool isRainy = true;
  bool hasUmbrella = false;

  // and
  // T && T --> true
  print(isRainy && hasUmbrella);
  print(hasUmbrella && isRainy);

  // or
  print(isRainy || hasUmbrella);
  print(hasUmbrella || isRainy);

  // not
  print(!isRainy);
}
