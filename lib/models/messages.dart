import 'dart:convert';

class Message {
  String message;
  String senderId;
  String receiverId;
  String chatRoomId;
  DateTime timestamp;

  Message(
      {required this.message,
      required this.chatRoomId,
      required this.receiverId,
      required this.senderId,
      required this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'chatRoomId': chatRoomId
    };
  }
}
