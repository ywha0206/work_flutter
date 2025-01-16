import 'package:flutter/material.dart';

// 상태가 있는 위젯을 만들어 보자
// 1. StatefulWidget 위젯을 상속받았다.
// 두 개의 클래스가 한 묶음이다

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  // 멤버 변수
  // tabController는 TabBar와 TabBarView를 동기화하는 컨트롤러입니다.
  TabController? _tabController;

  // 단 한 번 호출되는 메서드이다.
  @override
  void initState() {
    super.initState();
    print('프로필 탭 내부 클래스 init 호출했다');
    // length 는 탭의 개수를 의미한다.
    // vsync는 자연스러운 애니메이션 전환을 위해서 TickerProvider를 활용한다.
    _tabController = TabController(length: 2, vsync: this);
  }

  // build 메서드는 기본적으로 그림을 그릴 때 호출이 된다.
  @override
  Widget build(BuildContext context) {
    // 화면을 그려주는 영역
    print('빌드 호출');
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: _buildTabBarView(),
        ),
      ],
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          itemCount: 40,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1, // 열 (컬럼) 사이의 간격을 10으로 설정
            mainAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            return Image.network(
              'https://picsum.photos/id/${index}/200',
              //fit: BoxFit.cover,
            );
          },
        ),
        ListView.separated(
          itemCount: 28,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/id/${index + 100}/200'),
                  ),
                  title: Text('My Friends ${index + 1}'),
                  subtitle: Text('새로운 친구를 만들어 봐요.'),
                  trailing: Wrap(
                    children: [
                      _sendMessageButton(context, index),
                      _addFriendsButton(context, index),
                    ],
                  )),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 0.5,
            );
          },
        ),
      ],
    );
  }

  IconButton _addFriendsButton(BuildContext context, int index) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('My Friends ${index + 1} 님을 친구로 추가하시겠습니까?'),
              content: Text(
                '친구가 수락하면 친구 관계가 형성됩니다!',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Yes")),
              ],
            );
          },
        );
      },
      icon: Icon(
        Icons.add,
        color: Colors.grey,
      ),
    );
  }

  IconButton _sendMessageButton(BuildContext context, int index) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('My Friends ${index + 1} 님에게 빠른 메세지를 보내시겠습니까?'),
              content: TextField(),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Send")),
              ],
            );
          },
        );
      },
      icon: Icon(
        Icons.send,
        color: Colors.grey,
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      // 중간 매개체로 연결
      controller: _tabController,
      tabs: [
        Tab(
          icon: Icon(Icons.ac_unit),
        ),
        Tab(
          icon: Icon(Icons.people_alt),
        ),
      ],
    );
  }
}
