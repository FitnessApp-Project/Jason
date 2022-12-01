// import 'dart:async';
// import 'package:FitnessApp/models/Record.dart';
// import 'package:FitnessApp/sports menu//poseIntro.dart';
// import 'package:FitnessApp/sports menu/pose list.dart';
// import 'package:FitnessApp/tabBar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'package:FitnessApp/helpers/Constants.dart';
//
// import 'package:FitnessApp/poseRecognition/detection.dart';
//
// /*
// void main() {
//   runApp(const DetectionInitial());
// }
// */
//
// class DetectionInitial extends StatefulWidget {
//
//   DetectionInitial({Key? key}) : super(key: key);
//
//   @override
//   State<DetectionInitial> createState() {
//     return _DetectionInitialState();
//   }
// }
//
// class _DetectionInitialState extends State<DetectionInitial> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         leading:IconButton(
//           iconSize: 30,
//           icon: Icon(Icons.cancel, size: 30.0, color: Colors.white),
//           onPressed: () {
//             debugPrint('Cancel');
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()));
//           },
//         ) ,
//         title: Text(
//           // UndoneList().getrecord().poseName,
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             iconSize: 30,
//             icon: Icon(Icons.volume_up, size: 30.0, color: Colors.white),
//             onPressed: () {
//               debugPrint('volume_up');
//             },
//           ),
//         ],
//       ),
//       body:Stack(
//           children: [
//             // ExerciseFrame(),
//             //Detection(),
//           ],
//       )
//       //ExerciseFrame(),
//     );
//   }
// }
