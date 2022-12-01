import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:FitnessApp/tabBar.dart';
import 'package:body_detection/models/image_result.dart';
import 'package:body_detection/models/pose.dart';

import 'package:body_detection/png_image.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:body_detection/body_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'pose_mask_painter.dart';
import 'counterPaint.dart';
import 'outSidePaint.dart';
import 'HalfCircle.dart';
import 'package:FitnessApp/helpers/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'provider.dart' as globals;
import 'package:FitnessApp/sports menu/page1.dart';

class Detection extends StatefulWidget {
  const Detection({Key? key, required this.SportName, required this.Content});
  final String SportName;
  final String Content;
  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  Pose? _detectedPose;
  ui.Image? _maskImage;
  Image? _cameraImage;
  Size _imageSize = Size.infinite;
  CameraDescription? cameraDescription;
  List<CameraDescription> cameras = [];
  late final CameraController _camera;

  @override
  void initState() {
    super.initState();
    // NOTE: Calling this function here would crash the app.
    _startCameraStream();
  }

  @override
  deactivate(){
    super.deactivate();
    BodyDetection.stopCameraStream();
    BodyDetection.disablePoseDetection();
    globals.Provider.initVariables();
  }

  Future<void> _startCameraStream() async {
    await BodyDetection.enablePoseDetection();
    WidgetsFlutterBinding.ensureInitialized();
    final request = await Permission.camera.request();
    print(request);
    cameras = await availableCameras();
    _camera = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );

    if (request.isGranted) {
      await BodyDetection.startCameraStream(
        onFrameAvailable: _handleCameraImage,
        onPoseAvailable: (pose) {
          // if (!_isDetectingPose) return;
          _handlePose(pose);
          setState(() {
            CameraPreview(_camera);
          });
        },
      );
    }
  }

  Future<void> jumpToHomePage() async{
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => HomePage()));
  }

  void _handleCameraImage(ImageResult result) {
    // Ignore callback if navigated out of the page.
    if (!mounted) return;

    // To avoid a memory leak issue.
    // https://github.com/flutter/flutter/issues/60160
    // PaintingBinding.instance?.imageCache?.clear();
    //PaintingBinding.instance?.imageCache?.clearLiveImages();

    final image = Image.memory(
      result.bytes,
      gaplessPlayback: true,
      fit: BoxFit.fill,
    );

    setState(() {
      _cameraImage = image;
      _imageSize = result.size;
      print("Size " + _imageSize.toString());
    });
  }

  void _handlePose(Pose? pose) {
    // Ignore if navigated out of the page.
    if (!mounted) return;
    setState(() {
      _detectedPose = pose;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(globals.Provider.squatState == "Done" || globals.Provider.kneelinglegraise == "Done" || globals.Provider.sidelegraiseState == "Done"
        || globals.Provider.sidelegraiseState == "Done" || globals.Provider.lungeState == "Done"
        || globals.Provider.statedForwardBendStretchState == "Done") {
      jumpToHomePage();
    }

    return MaterialApp(
      home:
        Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:PreferredSize(
                preferredSize: Size.fromHeight(40), // here the desired height
                child: AppBar(
                  title: Text(
                      widget.SportName,
                      style: TextStyle(fontSize: 25),
                  ),
                  leading:IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.cancel, size: 30.0, color: Colors.white),
                    onPressed: () {
                      debugPrint('Cancel');
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HomePage()));
                      deactivate();
                    },
                  ) ,
                  centerTitle: true,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                ),
            ),
            body:
              Container(
                  foregroundDecoration: BoxDecoration(
                      border: new Border(
                          bottom: BorderSide(width: 20, color: kPrimaryColor),
                          left: BorderSide(width: 20, color: kPrimaryColor),
                          right: BorderSide(width: 20, color: kPrimaryColor),
                      ),
                  ),
                  child:
                    Column(
                        children: <Widget>[
                          Container(
                            color: Color.fromRGBO(245, 232, 43, 1),
                            child: CustomPaint(
                              size:Size.fromHeight(120),
                              foregroundPainter:counterPaint(widget.Content),
                            ),
                          ),
                          Expanded(
                              child:
                              RepaintBoundary(
                                child:CustomPaint(
                                  // size: const Size(double.infinity, double.infinity),
                                  // size:Size.fromWidth(360),
                                  child: _cameraImage,
                                  foregroundPainter: PoseMaskPainter(
                                    pose: _detectedPose,
                                    mask: _maskImage,
                                    imageSize: _imageSize,
                                    sportName: widget.SportName,
                                  ),
                                ),
                              ),
                          )
                        ]
                    ), // CustomPaint
              )
      ),
    );
  }
}
