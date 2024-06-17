import 'package:flutter/material.dart';
import 'package:messaging_app/components/text_field.dart';

class MessageInput extends StatefulWidget {
  TextEditingController messageController;
  void Function() sendMessage;
  MessageInput(
      {super.key, required this.sendMessage, required this.messageController});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MyTextField(
          hintText: "Enter a message...",
          controller: widget.messageController,
          obscure: false,
        )),
        IconButton(
            onPressed: () => widget.sendMessage(),
            icon: Icon(
              Icons.send,
              size: 30,
            ))
      ],
    );
  }
}
