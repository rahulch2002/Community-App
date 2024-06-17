import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/components/message_input.dart';
import 'package:messaging_app/components/message_list.dart';
import 'package:messaging_app/services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  String senderId, receiverId;
  ChatScreen({super.key, required this.senderId, required this.receiverId});

  @override
  State<ChatScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController messageController = TextEditingController();
  late ChatService chatService;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    chatService =
        ChatService(senderId: widget.senderId, receiverId: widget.receiverId);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void sendMessage() async {
    if (!messageController.text.isEmpty) {
      await chatService.sendMessage(messageController.text);
      messageController.clear();
    }
  }

  void getMessages() async {
    Stream<QuerySnapshot<Map<String, dynamic>>> chatStream =
        await chatService.getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: MessageList(
                chatService: chatService,
              ),
            ),
            MessageInput(
                sendMessage: sendMessage, messageController: messageController)
          ],
        ),
      ),
    );
  }
}
