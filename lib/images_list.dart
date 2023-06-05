import 'dart:io';

import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    var imageList = Directory('C:/Users/HARSH/my_folder')
        .listSync(recursive: true)
        .map((item) => item.path)
        .where((item) => item.endsWith(".jpg"))
        .toList(growable: true);
    print(imageList);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                ),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.file(File(imageList[index])));
                }),
          ),
        ],
      ),
    );
  }
}
