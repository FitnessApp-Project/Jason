import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/game/components/GameIn_image.dart';
import 'package:FitnessApp/game/components/GameIn_operate.dart';
import '../helpers/Constants.dart';
import 'package:window_size/window_size.dart';

import '/Sports menu/page1.dart';
import '/setting/Setting.dart';
import '/setting/Setting2.dart';

const double windowWidth = 1024;
const double windowHeight = 800;

class GameIn extends StatelessWidget {
  const GameIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: kPrimaryColor,
          // appBar: AppBar(
          //   backgroundColor: kPrimaryColor,
          // ),
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                   child: GameIn_image(),
                  ),
                  GameIn_operate(),
                ]),
          )),
    );
  }
}
