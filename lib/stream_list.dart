import 'dart:io';

import 'package:flutter/material.dart';

class StreamList extends StatefulWidget {
  const StreamList({Key? key}) : super(key: key);

  @override
  State<StreamList> createState() => _StreamListState();
}

class _StreamListState extends State<StreamList> {
  List<String> ls1 = [];
  List<String> ls = [];
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Directory('C:/Users/HARSH/my_folder')
        .watch(recursive: true, events: FileSystemEvent.create)
        .listen((event) {
      ls1.add(event.path);
      print('length of paths ${ls1.length}');
      ls = ls1.where((element) => element.endsWith('.jpg')).toList();
      value = ls.length / 64;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(value);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: ls.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.file(File(ls[index])),
                );
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              color: Colors.red,
              backgroundColor: Colors.black,
              value: value,
            ),
          ),
        )
      ],
    ));
  }
}
