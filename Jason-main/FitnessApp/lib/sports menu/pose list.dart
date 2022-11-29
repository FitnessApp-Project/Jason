import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double BoxHeight = 200.0;
const double gap = 10.0;

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(context) {
    //final controller = Provider.of<InfiniteProcessIsolateController>(context);

    return SafeArea(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => MyItem(index),
        ),
      ),
      /*child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: gap,
              height: BoxHeight,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: gap + BoxHeight,
              height: BoxHeight,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: gap * 2 + BoxHeight * 2,
              height: BoxHeight,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: gap * 3 + BoxHeight * 3,
              height: BoxHeight,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Positioned(
              bottom: 100.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                ),
                onPressed: () => print('hello'),
                child: const Text('Start'),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}

class MyItem extends StatelessWidget {
  final int index;

  const MyItem(this.index);

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length];
    final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: color,
          )),
      title: Text('Material Color #${index + 1}'),
      subtitle: Text('#$hexRgb'),
    );
  }
}