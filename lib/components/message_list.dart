import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/services/chat_service.dart';

class MessageList extends StatefulWidget {
  ChatService chatService;
  MessageList({super.key, required this.chatService});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.chatService.getMessages(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = snapshot.data!.docs;

        return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                alignment: data[index]['senderId'] !=
                        FirebaseAuth.instance.currentUser!.uid
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Column(
                  children: [
                    Text(data[index]['email']),
                    Text(data[index]['message'])
                  ],
                ),
              );
            },
            itemCount: data.length);
      },
    );
  }
}
