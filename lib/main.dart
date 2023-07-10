import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_file_system/images_list.dart';
import 'package:flutter_file_system/stream_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import 'filter_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FilterImages(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? path;
  Uint8List? image;
  File? imageFile;
  String? workingDirectory='';
  @override
  Widget build(BuildContext context) {
    print('h');
    return Scaffold(
      appBar: AppBar(
        title: const Text('File'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('path : $path'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  /// Write to external storage
                  // final directory = await getApplicationDocumentsDirectory();
                  // print('directory $directory');
                  // final path = 'C:/Users/HARSH/my_folder';
                  //  Directory(path).create(recursive: true);
                  final myFilePath = 'C:/Users/HARSH/my_folder/image4.jpg';
                  final myFile = File(myFilePath);
                  // String imageUrl =
                  //     'https://ichef.bbci.co.uk/news/976/cpsprodpb/1572B/production/_88615878_976x1024n0037151.jpg';
                  // var response = await http.get(Uri.parse(imageUrl));
                  // print(response.statusCode);
                  //
                  // /// Write some data to the file
                  // const data = 'wdwdwdww';
                  //
                  // myFile.writeAsBytes(response.bodyBytes);
                  // image = await myFile.readAsBytes();
                  imageFile = myFile;
                  setState(() {});

                  // final status = await Permission.storage.request();
                  // if (status == PermissionStatus.granted) {
                  //   print("Allowed");
                  //   String folderName = "My New Downloads";
                  //   var path = "storage/emulated/0/$folderName";
                  //   await Directory(path).create();
                  // } else {
                  //   print("Denyed");
                  // }
                  // String folderName = "My New Downloads";
                  // var path = "storage/emulated/0/$folderName";
                  // await new Directory(path).create();
                  // Permission.manageExternalStorage.request();
                  // final directory = await getExternalStorageDirectory();
                  // print('directory ${directory!.path}');
                  // final myFolderPath = 'storage/emulated/0/my_folder';
                  // await Directory(myFolderPath).create();
                  //
                  // /// Create a file called 'my_file.txt' inside the 'my_folder' directory
                  // final myFilePath = '$myFolderPath/text.txt';
                  // final myFile = File(myFilePath);
                  //
                  // /// Write some data to the file
                  // const data = 'wdwdwdww';
                  //
                  // myFile.writeAsString(data);
                },
                child: Text('Get Path')),
            const SizedBox(
              height: 20,
            ),
            // image == null ? const SizedBox() : Image.memory(image!),
            const SizedBox(
              height: 20,
            ),
            imageFile == null ? const SizedBox() : Image.file(imageFile!),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Directory current = Directory.current;
              print('current directroy ${current.path}');
              setState(() {
                workingDirectory=current.path;
              });
            }, child: Text('Get current directory')),
            const SizedBox(
              height: 20,
            ),
            Text('directory name $workingDirectory')
          ],
        ),
      ),
    );
  }
}
