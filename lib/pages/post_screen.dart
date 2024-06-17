import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messaging_app/services/post_service.dart';

class PostsScreen extends StatefulWidget {
  String senderId;
  PostsScreen({super.key, this.senderId});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late PostService postService;

  @override
  void initState() {
    super.initState();
    postService =
        PostService(senderId: widget.senderId, receiverId: receiverId);
  }

  void sendPost() async {
    if (!messageController.text.isEmpty) {
      await chatService.sendMessage(messageController.text);
      messageController.clear();
    }
  }

  void getPosts() async {
    Stream<QuerySnapshot<Map<String, dynamic>>> postStream =
        await postService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Posts')),
      body: Container(child: PostList(postService: postService)),
    );
  }
}
