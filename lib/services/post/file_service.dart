import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

class FileService {
  UploadTask? uploadTask;

  Future<List<PlatformFile>> selectFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result == null) return [];
    return result.files;
  }

  Future<String> uploadFile(PlatformFile pickedFile) async {
    final path = pickedFile.name;
    final file = File(pickedFile.path!);

    final ref = FirebaseStorage.instance.ref().child(path);

    // setState(() {
    //   uploadTask = ref.putFile(file);
    // });
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    uploadTask = null;

    return urlDownload;

    // setState(() {
    //   uploadTask = null;
    //   pickedFile = null;
    // });
  }

  Widget progressBar() {
    return StreamBuilder(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          double progress = data!.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                ),
                Center(
                  child: Text('${(100 * progress).roundToDouble()}%'),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final width = MediaQuery.of(context).size.width;
  //   return Scaffold(
  //     body: Container(
  //       width: width,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             pickedFile != null
  //                 ? Image.file(File(pickedFile!.path!))
  //                 : SizedBox(),
  //             FloatingActionButton(
  //               onPressed: () => selectFile(),
  //               child: Text('Select File'),
  //             ),
  //             FloatingActionButton(
  //               onPressed: () => uploadFile(),
  //               child: Text('Upload File'),
  //             ),
  //             // uploadTask == null ? SizedBox() : progressBar()
  //           ],
  //         ),
  //       ),
  //     ),
  //     appBar: AppBar(
  //       title: Text(""),
  //     ),
  //   );
  // }
}
