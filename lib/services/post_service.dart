import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String senderId;
  late String postId;

  List<String> comments;
  Map<String, int> reactions;
  late DateTime time;

  PostService(
      {required this.senderId,
      this.reactions = const {'Happy': 0, 'Sad': 0, 'Excited': 0},
      this.comments = const []}) {
    postId = senderId + "/@";
    time = DateTime.now();
  }

  Future<String> postContent(String message, List<String> mediaFiles) async {
    Post newPost = Post(
        postId: postId,
        senderId: senderId,
        comments: comments,
        mediaFiles: mediaFiles,
        reactions: reactions,
        text: message,
        timestamp: time);

    await firebaseFirestore.collection('posts').add(newPost.toJson());

    return postId;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPosts() {
    return firebaseFirestore
        .collection('posts')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
