import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/material.dart';

class MyImageWidget extends StatefulWidget {
  final String imagePath;

  MyImageWidget({required this.imagePath});

  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<MyImageWidget> {
  late Future<File> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
  }

  Future<File> loadImage() async {
    return File(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: _imageFuture,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final file = snapshot.data!;
          return Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image(
              image: MemoryImage(file.readAsBytesSync()),
              // Other image properties like width, height, fit, etc.
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
              width: 200,
              height: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(child: Text('Error loading image')));
        } else {
          return Container(
              width: 200,
              height: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
