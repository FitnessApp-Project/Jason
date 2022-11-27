import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:FitnessApp/Sports%20menu/pose%20listV2.dart';
import 'package:provider/provider.dart';
import 'package:FitnessApp/sports menu/pose listV2 for test.dart';
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
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => MyItem(index),
            ),
          ),
          /*Positioned(
            height: 50,
            width: 200,
            bottom: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10.0,
              ),
              onPressed: () => print('hello'),
              child: const Text('Start',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ),*/
        ],
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
            Center(
              child: Positioned(
                child: Text(
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => PoseListV2ForTest()));

      },
    );
  }
}
