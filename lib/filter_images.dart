import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'image_future.dart';

class FilterImages extends StatefulWidget {
  const FilterImages({super.key});

  @override
  State<FilterImages> createState() => _FilterImagesState();
}

class _FilterImagesState extends State<FilterImages> {
  // void filterImagesWithPattern() {
  //   // Directory containing the images
  //   Directory imageDir = Directory('path/to/images');
  //
  //   // Regular expression pattern to match "digit_digit_digit" filenames
  //   RegExp pattern = RegExp(r'\b\d{2}_(?!0\d)\d{2}_(?!0\d)\d{2}\b');
  //
  //   try {
  //     // List all files in the directory
  //     List<FileSystemEntity> files = imageDir.listSync();
  //
  //     // Filter and print the filenames matching the pattern
  //     for (var file in files) {
  //       if (file is File) {
  //         String filename = path.basename(file.path);
  //         if (pattern.hasMatch(filename)) {
  //           print(filename);
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print('Error filtering images: $e');
  //   }
  // }
  List<String> ls = [];
  @override
  Widget build(BuildContext context) {
    // var imageList = Directory('C:/Users/Admin/Downloads/myfolder')
    //     .listSync(recursive: true)
    //     .map((item) => item.path)
    //     .where((item) =>
    //         !basename(item).startsWith('s') &&
    //         RegExp(r'\d+_\d+_\d+\.jpg$').hasMatch(item))
    //     .toList(growable: true);
    // print('image length ${imageList.length}');
    print(ls.length);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<FileSystemEvent>(
                stream: Directory('C:/Users/Admin/Downloads/myfolder')
                    .watch(recursive: false, events: FileSystemEvent.create),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    ls.add(snapshot.data!.path);
                  }
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: ls.length,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: File(ls[index]).existsSync()
                                ? Image.memory(
                                    File(ls[index]).readAsBytesSync())
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ));
                        return MyImageWidget(
                          imagePath: ls[index],
                        );

                        // return Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.black)),
                        //     child: SizedBox(
                        //       width: 200,
                        //       height: 200,
                        //       child: file.existsSync()
                        //           ? Image.file(file)
                        //           : Container(),
                        //     ));
                      });
                }),
          ),
        ],
      ),
    );
  }
}
