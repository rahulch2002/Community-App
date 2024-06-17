import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/models/messages.dart';

class ChatService extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late String senderId, receiverId, chatRoomId;

  ChatService({required this.senderId, required this.receiverId}) {
    List<String> ids = [senderId, receiverId];
    ids.sort();
    chatRoomId = ids[0] + '_' + ids[1];
  }

  Future<void> sendMessage(String message) async {
    Message newMessage = Message(
        message: message,
        chatRoomId: chatRoomId,
        senderId: senderId,
        receiverId: receiverId,
        timestamp: DateTime.now());
    await firebaseFirestore
        .collection('messaging')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    return firebaseFirestore
        .collection('messaging')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
