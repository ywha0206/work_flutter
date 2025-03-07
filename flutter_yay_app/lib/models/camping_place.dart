class CampingPlace {
  String name;
  String address;
  double star;
  String image;

  CampingPlace(
      {required this.name,
      required this.address,
      required this.star,
      required this.image});
}

List<CampingPlace> placeList = [
  CampingPlace(
    name: '엉클킴스',
    address: '경기 포천시 신북면 금동리 5-5',
    star: 5.0,
    image: 'https://picsum.photos/id/122/200/200',
  ),
  CampingPlace(
    name: '해피캠프',
    address: '강원 속초시 설악로 23-10',
    star: 4.5,
    image: 'https://picsum.photos/id/101/200/200',
  ),
  CampingPlace(
    name: '숲속의하루',
    address: '경남 거창군 가조면 우두산로 45',
    star: 4.7,
    image: 'https://picsum.photos/id/102/200/200',
  ),
  CampingPlace(
    name: '은하수캠핑장',
    address: '충북 단양군 가곡면 소야로 12',
    star: 4.3,
    image: 'https://picsum.photos/id/103/200/200',
  ),
  CampingPlace(
    name: '푸른초원캠프',
    address: '경기 가평군 청평면 산청로 77',
    star: 4.8,
    image: 'https://picsum.photos/id/104/200/200',
  ),
  CampingPlace(
    name: '별빛야영장',
    address: '경북 청송군 부남면 대전로 123',
    star: 4.6,
    image: 'https://picsum.photos/id/105/200/200',
  ),
  CampingPlace(
    name: '강변캠핑파크',
    address: '전북 전주시 덕진구 송천로 88',
    star: 4.4,
    image: 'https://picsum.photos/id/106/200/200',
  ),
  CampingPlace(
    name: '힐링가든',
    address: '충남 태안군 안면읍 안면로 56',
    star: 4.9,
    image: 'https://picsum.photos/id/107/200/200',
  ),
  CampingPlace(
    name: '블루캠프',
    address: '경북 경주시 보문로 32',
    star: 4.2,
    image: 'https://picsum.photos/id/108/200/200',
  ),
  CampingPlace(
    name: '달빛캠핑장',
    address: '강원 평창군 대관령면 캠핑로 88',
    star: 4.7,
    image: 'https://picsum.photos/id/109/200/200',
  ),
  CampingPlace(
    name: '새벽숲야영장',
    address: '전남 해남군 송지면 숲로 23',
    star: 4.8,
    image: 'https://picsum.photos/id/110/200/200',
  ),
  CampingPlace(
    name: '하늘캠핑장',
    address: '제주 제주시 한라산로 15',
    star: 5.0,
    image: 'https://picsum.photos/id/111/200/200',
  ),
  CampingPlace(
    name: '호숫가캠프',
    address: '경남 진주시 남강로 21',
    star: 4.3,
    image: 'https://picsum.photos/id/112/200/200',
  ),
  CampingPlace(
    name: '모닝파크',
    address: '충북 청주시 상당구 대청호로 92',
    star: 4.6,
    image: 'https://picsum.photos/id/113/200/200',
  ),
  CampingPlace(
    name: '달구벌캠핑',
    address: '대구 동구 팔공로 8',
    star: 4.7,
    image: 'https://picsum.photos/id/114/200/200',
  ),
  CampingPlace(
    name: '솔밭야영장',
    address: '경기 남양주시 별내로 99',
    star: 4.2,
    image: 'https://picsum.photos/id/115/200/200',
  ),
  CampingPlace(
    name: '해안선캠프',
    address: '부산 해운대구 해운로 56',
    star: 4.5,
    image: 'https://picsum.photos/id/116/200/200',
  ),
  CampingPlace(
    name: '힐링숲캠프',
    address: '충북 제천시 봉양읍 숲속로 78',
    star: 4.8,
    image: 'https://picsum.photos/id/117/200/200',
  ),
  CampingPlace(
    name: '산너울야영장',
    address: '전북 무주군 설천면 덕유산로 12',
    star: 4.7,
    image: 'https://picsum.photos/id/118/200/200',
  ),
  CampingPlace(
    name: '바다향기캠핑장',
    address: '경남 남해군 바다로 50',
    star: 4.9,
    image: 'https://picsum.photos/id/119/200/200',
  ),
  CampingPlace(
    name: '노을캠프',
    address: '강원 양양군 낙산로 32',
    star: 4.3,
    image: 'https://picsum.photos/id/120/200/200',
  ),
  CampingPlace(
    name: '솔향캠핑파크',
    address: '전남 고흥군 소록로 77',
    star: 4.5,
    image: 'https://picsum.photos/id/121/200/200',
  ),
  CampingPlace(
    name: '해돋이야영장',
    address: '경북 울진군 죽변면 해돋이로 101',
    star: 4.6,
    image: 'https://picsum.photos/id/122/200/200',
  ),
  CampingPlace(
    name: '푸른하늘캠프',
    address: '서울 노원구 공릉로 88',
    star: 4.4,
    image: 'https://picsum.photos/id/123/200/200',
  ),
  CampingPlace(
    name: '별바람야영장',
    address: '충남 공주시 계룡로 56',
    star: 4.7,
    image: 'https://picsum.photos/id/124/200/200',
  ),
  CampingPlace(
    name: '바람의숲캠프',
    address: '경기 양주시 숲로 33',
    star: 4.9,
    image: 'https://picsum.photos/id/125/200/200',
  ),
  CampingPlace(
    name: '은하수정원',
    address: '전남 순천시 정원로 44',
    star: 4.8,
    image: 'https://picsum.photos/id/126/200/200',
  ),
  CampingPlace(
    name: '달빛정원캠프',
    address: '충북 옥천군 정원로 18',
    star: 4.6,
    image: 'https://picsum.photos/id/127/200/200',
  ),
  CampingPlace(
    name: '하모니캠핑장',
    address: '경기 평택시 송탄로 70',
    star: 4.5,
    image: 'https://picsum.photos/id/128/200/200',
  ),
  CampingPlace(
    name: '바람의정원',
    address: '강원 강릉시 정동로 22',
    star: 4.8,
    image: 'https://picsum.photos/id/129/200/200',
  ),
];
