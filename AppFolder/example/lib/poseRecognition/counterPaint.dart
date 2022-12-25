import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:body_detection/models/pose.dart';
import 'package:body_detection/models/pose_landmark.dart';
import 'package:body_detection/models/pose_landmark_type.dart';

import 'package:body_detection/models/point3d.dart';
import 'dart:math';
import 'provider.dart' as globals;

class counterPaint extends CustomPainter {
  counterPaint(
      this.Content
  );
  String Content;

  final rightPointPaint = Paint()
    ..color = const Color.fromRGBO(100, 208, 218, 1);

  @override
  void paint(Canvas canvas, Size size) {
    _paintCount(canvas, size, Offset(0, 0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _paintCount(Canvas canvas, Size size, Offset position) {
    TextSpan Counter = TextSpan(
      text: globals.Provider.counter.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 80,
        // height: 15
      ),
    );
    TextSpan Timer = TextSpan(
      text: globals.Provider.timer.toString(),
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 80,
        // height: 15
      ),
    );

    TextSpan set = TextSpan(
      text: "次數",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 40,
      ),
    );

    TextSpan second = TextSpan(
      text: "秒數",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 40,
        // height: 15
      ),
    );

    TextSpan showContent = TextSpan(
      text: Content,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 34,
      ),
    );

    TextSpan down = TextSpan(
      text: "請往下",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );
    TextSpan up = TextSpan(
      text: "請往上",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );
    TextSpan outOfRange = TextSpan( //超出鏡頭範圍
      text: "超出範圍",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan sidelegraiseleft = TextSpan(
      text: "身體朝左",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );
    TextSpan sidelegraiseright = TextSpan(
      text: "身體朝右",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );
    TextSpan kneelinglegraiseRight = TextSpan(
      text: "請抬右腿",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );
    TextSpan kneelinglegraiseLeft = TextSpan(
      text: "請抬左腿",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );
    TextSpan pyramidStretchLeft = TextSpan(
      text: "朝左腳尖拉",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan pyramidStretchRight = TextSpan(
      text: "朝右腳尖拉",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan lungeLeft = TextSpan(
      text: "左腳往前",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan lungeRight = TextSpan(
      text: "右腳往前",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan statedForwardBendStretchStateLeft = TextSpan(
      text: "向左腳拉",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan statedForwardBendStretchStateRight = TextSpan(
      text: "向右腳拉",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 30,
        // height: 15,
      ),
    );

    TextSpan Done = TextSpan(
      text: "已完成",
      style: const TextStyle(
        color: Color.fromRGBO(249, 246, 255, 1),
        fontSize: 25,
        // height: 15,
      ),
    );


    TextPainter con = TextPainter(text:showContent, textAlign: TextAlign.left);
    con.textDirection = TextDirection.ltr;
    con.layout();
    con.paint(canvas, Offset(size.width/2+48 ,12 ));

    if(globals.Provider.CounterOrTimer == "Timer"){
      TextPainter tp = TextPainter(text: Timer, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width / 2 - 30, size.height / 3 - 10));
      TextPainter tp1 = TextPainter(text: second, textAlign: TextAlign.left);
      tp1.textDirection = TextDirection.ltr;
      tp1.layout();
      tp1.paint(canvas, Offset(30, 10) );
    }else{
      TextPainter tp = TextPainter(text: Counter, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width / 2 - 30 , size.height / 3 - 10));
      TextPainter tp1 = TextPainter(text: set, textAlign: TextAlign.left);
      tp1.textDirection = TextDirection.ltr;
      tp1.layout();
      tp1.paint(canvas, Offset(30, 10) );
    }

    if (globals.Provider.state == "down") {
      TextPainter tp = TextPainter(text: down, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(30, size.height / 2 + 10));
    } else if (globals.Provider.state == "up") {
      TextPainter tp = TextPainter(text: up, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(30, size.height / 2 + 10));
    } else if (globals.Provider.state == "outOfRange") {
      TextPainter tp = TextPainter(text: outOfRange, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(30, size.height / 2 + 10));
    }

    if (globals.Provider.sidelegraiseState == "left") {
      TextPainter tp = TextPainter(text: sidelegraiseleft, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }else if (globals.Provider.sidelegraiseState == "right") {
      TextPainter tp = TextPainter(text: sidelegraiseright, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }

    if (globals.Provider.kneelinglegraiseState == "left") {
      TextPainter tp = TextPainter(text: kneelinglegraiseLeft, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }else if (globals.Provider.kneelinglegraiseState == "right") {
      TextPainter tp = TextPainter(text: kneelinglegraiseRight, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }

    if (globals.Provider.pyramidStretchState == "left") {
      TextPainter tp = TextPainter(text: pyramidStretchLeft, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }else if (globals.Provider.pyramidStretchState == "right") {
      TextPainter tp = TextPainter(text: pyramidStretchRight, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }

    if (globals.Provider.lungeState == "left") {
      TextPainter tp = TextPainter(text: lungeLeft, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }else if (globals.Provider.lungeState == "right") {
      TextPainter tp = TextPainter(text: lungeRight, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }

    if (globals.Provider.statedForwardBendStretchState == "left") {
      TextPainter tp = TextPainter(text: statedForwardBendStretchStateLeft, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }else if (globals.Provider.statedForwardBendStretchState == "right") {
      TextPainter tp = TextPainter(text: statedForwardBendStretchStateRight, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(size.width/2+48, size.height-50));
    }

    if (globals.Provider.squatState == "Done" || globals.Provider.legpulloverState == "Done" || globals.Provider.kneelinglegraiseState == "Done" || globals.Provider.pyramidStretchState == "Done"
        || globals.Provider.sidelegraiseState == "Done" || globals.Provider.lungeState == "Done"
        || globals.Provider.statedForwardBendStretchState == "Done") {
      TextPainter tp = TextPainter(text: Done, textAlign: TextAlign.left);
      tp.textDirection = TextDirection.ltr;
      tp.layout();
      tp.paint(canvas, Offset(5, 5));
    }
  }
}