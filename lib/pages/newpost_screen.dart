import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:messaging_app/services/post/file_service.dart';
import 'dart:io';

import 'package:messaging_app/services/post_service.dart';

class NewPostScreen extends StatefulWidget {
  String senderId;
  NewPostScreen({required this.senderId});
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _textController = TextEditingController();
  List<XFile>? pickedImages = [];
  List<PlatformFile>? pickedFiles = [];
  List<String> mediaFiles = [];
  PostService? postService;
  String curNewPostId = '';
  FileService fileService = FileService();
  bool uploadingFiles = false;

  void pickFiles() async {
    try {
      final pickedFileResults = await fileService.selectFiles();
      setState(() {
        pickedFiles = pickedFileResults;
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  void uploadpickedFiles() async {
    try {
      setState(() {
        uploadingFiles = true;
      });
      List<Future<String>> promises = [];
      pickedFiles!.forEach((file) {
        promises.add(fileService.uploadFile(file));
      });
      promises.forEach((promise) {
        promise.then((downloadUrl) => mediaFiles.add(downloadUrl));
      });
      setState(() {
        uploadingFiles = false;
        pickedFiles = [];
        pickedImages = [];
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  void createNewPost() async {
    try {
      final res = postService!.postContent(_textController.text, mediaFiles);
      res.then((newPostId) {
        setState(() {
          mediaFiles = [];
          curNewPostId = newPostId;
        });
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  @override
  void initState() {
    postService = PostService(senderId: widget.senderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Post'),
        actions: [
          TextButton(
            onPressed: () => createNewPost(),
            child: Text(
              'Post',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'What do you want to talk about?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            if (pickedImages != null)
              ...pickedImages!
                  .map((e) => Container(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(e.path),
                          height: 150,
                        ),
                      ))
                  .toList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: () => fileService.selectFiles(),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () => fileService.selectFiles(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
