import 'package:class_f_story/_core/constants/size.dart';
import 'package:class_f_story/data/gvm/session_gvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDrawer extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomDrawer(this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionGvm sessionGvm = ref.read(sessionProvider.notifier);
    return Container(
      height: double.infinity,
      width: getDrawerWidth(context),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
                Navigator.pushNamed(context, '/post/write');
              },
              child: Text(
                '글 쓰기',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () async {
                await sessionGvm.logout();
              },
              child: Text(
                '로그아웃',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
