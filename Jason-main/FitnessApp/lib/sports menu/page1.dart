import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:FitnessApp/Sports%20menu/pose%20listV2.dart';
import 'package:provider/provider.dart';
import 'package:FitnessApp/sports menu/pose listV2 for test.dart';
import 'package:flutter/cupertino.dart';

const double BoxHeight = 200.0;
const double gap = 5.0;


var icon_list = <IconData>[
  Icons.format_list_bulleted,
  Icons.edit,
  Icons.thumb_up,
  Icons.star_border,
];

var boxlabel = <String>[
  '腿部訓練動作列表',
  '自訂訓練表',
  '簡單訓練表',
  '困難訓練課表',
];

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(context) {
    //final controller = Provider.of<InfiniteProcessIsolateController>(context);
    return CupertinoPageScaffold(
        child:SafeArea(
          child:Container(
            margin: EdgeInsets.only(top: 10),
            child:Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) => MyItem(index),
                  ),
                ),
            ),
        ),
    );
  }
}

class MyItem extends StatelessWidget {
  final int index;

  const MyItem(this.index);

  @override
  Widget build(BuildContext context) {
    final color = Colors.orange[200 + 100 * (index + 1)];
    return InkWell(
      child: Container(
        //alignment: Alignment.center,
        height: 120,
        margin: EdgeInsets.only(left: 50, top: 20, right: 50, bottom: 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned( //圖標
              left: 20,
              child: Icon(
                icon_list[index],
                size: 100,
                color: Color.fromRGBO(255, 255, 255, 0.4),
              ),
            ),
            //Text('Scrollable 2 : Index $index'),
              Positioned(
                child: Center(
                  child:Text(
                  boxlabel[index],
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
          ],
        ),
      ),
      onTap: () {
        print("Click event on Container"+ index.toString());
        switch(index){
          case 1:
            // Navigator.push(context, CupertinoPageRoute(builder: (context) =>PoseListV2ForTest()));
            Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
              return PoseListV2ForTest(); //新打开的还是本控件,可无限重复打开
            }));
            break;
          default:
            //跳頁
        };
      },
    );
  }
}
