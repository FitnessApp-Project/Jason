import 'package:body_detection_example/cc/poseList/Record.dart';
import 'package:flutter/material.dart';

class PoseImage extends StatelessWidget {
  // const PoseImage({
  //   Key? key,
  // }) : super(key: key);
  PoseImage({
    Key? key,
    required this.poseName
  });
   String poseName;
   String imageAddress = "";
  @override
  Widget build(BuildContext context) {
    switch(poseName) {
      case "深蹲":
        imageAddress = 'assets/images/squat/squat1.jpg';
        break;
      case "自體腿部屈伸":
        imageAddress = 'assets/images/legpullover/legpullover1.png';
        break;
      case "側臥抬腿":
        imageAddress = 'assets/images/sidelegraise/sidelegraise1.png';
        break;
      case "跪姿抬腿":
        imageAddress = 'assets/images/kneelinglegraise/kneelinglegraise1.png';
        break;
      case "金字塔式":
        imageAddress = 'assets/images/pyramidStretch/pyramidStretch1.png';
        break;
      case "弓箭步":
        imageAddress = 'assets/images/lunge/lunge1.png';
        break;
      case "坐姿前彎伸展":
        imageAddress = 'assets/images/statedForwardBendStretch/statedForwardBendStretch1.png';
        break;
      default:
        imageAddress =
        'assets/images/squat/squat1.jpg';
        break;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: Colors.yellow,
        image: DecorationImage(
          // image: new ExactAssetImage('assets/images/IMG_20200704_134015.jpg'),
          image: new ExactAssetImage(imageAddress),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
