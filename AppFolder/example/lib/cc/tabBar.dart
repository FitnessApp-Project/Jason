import 'package:flutter/material.dart';
import 'Sports menu/homepage.dart';
import 'package:body_detection_example/poseRecognition/detection.dart';
import 'game/GameIn.dart';
import 'game/Play.dart';
import 'setting/Setting2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'calendar/CalendarPage.dart';
import 'package:body_detection_example/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

const double windowWidth = 1024;
const double windowHeight = 800;

class tabBar extends StatelessWidget {
  tabBar({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
    print('已登出');
  }

  TabBar get _tabBar => const TabBar(
        labelColor: Colors.black,
        indicatorColor: Colors.grey,
        tabs: [
          Tab(
            icon: Icon(Icons.home_outlined),
            text: '主頁',

          ),
          Tab(
            icon: Icon(Icons.pending_actions_outlined),
            text: '紀錄表',
          ),
          Tab(
            icon: Icon(Icons.group_outlined),
            text: '遊戲',
          ),
          Tab(
            icon: Icon(Icons.settings_outlined),
            text: '設定',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    print("User ");
    print(user?.displayName);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              leading: const Center(
                child: Text(
                  'Demo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              leadingWidth: 150,
              /*title: const Icon(Icons.menu),*/
              actions: [
                IconButton(
                  icon:Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () => signOut(),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                  ),
                  onPressed: () => print('按下'),
                ),
              ],
              bottom:
              PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  color: Colors.white,
                  child: Container(
                    child: _tabBar,
                  ),
                ),
              ),
            ),
            body: Center(
              child: TabBarView(children: [
                HomePage(),
                TableEventsExample(),
                GameIn(),
                //Detection(),
                //HomePage(),
                //HomePage(),
                Setting2(),
              ]),
            )),
      ),
    );
  }
}
