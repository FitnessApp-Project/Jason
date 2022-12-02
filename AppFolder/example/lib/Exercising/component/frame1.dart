// import 'dart:async';
// import 'package:body_detection_example/cc/sports%20menu/undoneList.dart';
// import 'package:body_detection_example/cc/tabBar.dart';
// import 'package:flutter/material.dart';
// import '../../cc/helpers/Constants.dart';
// import '../../Exercising/detection/detection.dart';
// import '../restTime.dart';
// import 'package:body_detection_example/poseRecognition/provider.dart' as globals;
// import 'package:body_detection_example/Exercising/initial.dart';
//
// class ExerciseFrame extends StatefulWidget {
//   const ExerciseFrame({Key? key}) : super(key: key);
//
//   @override
//   State<ExerciseFrame> createState() => _FrameState();
//
//   void stopTime() {
//     _FrameState().timer.cancel();
//   }
//   void stopState() {
//     _FrameState().dispose();
//   }
//
// }
//
// class _FrameState extends State<ExerciseFrame> {
//   int count = 0;
//   bool a = false;
//   late Timer timer;
//   Detection detection = Detection();
//
//   @override
//   void initState() {
//     super.initState();
//     // count = 5;
//     // _getTime();
//   }
//   @override
//   deactivate(){
//     super.deactivate();
//     detection.stopstream();
//   }
//
//   Future<int> _getTime() async {
//     timer = Timer.periodic(Duration(seconds: 1), (_) {
//       if (count > 0) {
//         setState(() {
//           count -= 1;
//         });
//       } else {
//         timer.cancel();
//         detection.stopstream();
//         if(UndoneList().getrecord()==UndoneList().getLastrecord()){
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => tabBar()));
//         }
//         // else{
//         //   Navigator.push(
//         //       context, MaterialPageRoute(builder: (context) => RestTime()));
//         // }
//       }
//     });
//     return count;
//   }
//
//   Future<void> _showPoseIntro(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           scrollable: true,
//           title: Text(
//             globals.Provider.record.poseName,
//             style: TextStyle(fontSize: 20),
//           ),
//           content: Container(
//             height: 400,
//             width: 300,
//             // height: 70 * StorageUtil.getDouble("textScaleFactor"),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image.asset('assets/images/IMG_20200704_134015.jpg'),
//                 Text('動作解說：' + "\n" + UndoneList().getrecord().introduction,
//                     style: TextStyle(color: Colors.black, fontSize: 20)),
//                 /*Text('次數/組數' + UndoneList().getrecord().number,
//                     style: TextStyle(color: Colors.black, fontSize: 15)),*/
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             // FlatButton(
//             //   color: Colors.red,
//             //   child: Text('取消', style: TextStyle(color: Colors.white)),
//             //   onPressed: () {
//             //     _getTime();
//             //     Navigator.of(context).pop();
//             //   },
//             // ),
//           ],
//         );
//       },
//     );
//   }
//
//   _setFrameColor(){
//       if (a == true) {
//         poseForBorder = Colors.green;
//       } else {
//         poseForBorder = Colors.red;
//       }
//       DetectionInitialState().initState();
//       // this.setState(() {
//       //   print("child set");
//       // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 600,
//       child:Center(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Positioned(bottom: 25, left: 0, child: detection),
//             //半圓結構
//             Positioned(
//               top: -200,
//               child: Container(
//                 width: 500,
//                 height: 500,
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 255, 203, 42),
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//             //--邊框
//             Positioned(
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                       top:    BorderSide(width: 100.0, color: poseForBorder, style: BorderStyle.solid),
//                       left:   BorderSide(width: 25.0, color: poseForBorder, style: BorderStyle.solid),
//                       right:  BorderSide(width: 25.0, color: poseForBorder, style: BorderStyle.solid),
//                       bottom: BorderSide(width: 25.0, color: poseForBorder, style: BorderStyle.solid)
//                   ),
//                 ),
//               ),
//             ),
//             const Positioned(
//               top: 120,
//               left: 40,
//               child: Text(
//                 "次數",
//                 style: TextStyle(fontSize: 35, color: Colors.white),
//               ),
//             ),
//             Positioned(
//               top: 160,
//               child: Text(
//                 count.toString(),
//                 style: TextStyle(fontSize: 100, color: Colors.white),
//               ),
//             ),
//             Positioned(
//               right: 40,
//               top: 120,
//               child: Text(
//                 UndoneList().getrecord().number,
//                 style: TextStyle(fontSize: 30, color: Colors.white),
//               ),
//             ),
//             Positioned(
//               bottom: 40,
//               right: 40,
//               child: IconButton(
//                 iconSize: 30,
//                 icon: Icon(Icons.question_mark, size: 30.0, color: Colors.grey),
//                 onPressed: () {
//                   print("問號被按下");
//                   // debugPrint('Cancel');
//                   _showPoseIntro(context);
//                   // // timer.cancel();
//
//                   //----邊框顏色測試
//                   if (a==true) {
//                     a = false;
//                     _setFrameColor();
//                   } else {
//                     a = true;
//                     _setFrameColor();
//                   }
//
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
