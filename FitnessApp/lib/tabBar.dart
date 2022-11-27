import 'package:flutter/material.dart';
import 'game/GameIn.dart';
import '/Sports menu/page1.dart';
import '/setting/Setting2.dart';
import 'calendar/CalendarPage.dart';

const double windowWidth = 1024;
const double windowHeight = 800;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  'Demooooooo',
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
                Page1(),
                TableEventsExample(),
                GameIn(),
                Setting2(),
              ]),
            )),
      ),
    );
  }
}
