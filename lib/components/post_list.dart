import 'package:flutter/material.dart';
import 'package:messaging_app/components/post_card.dart';
import 'package:messaging_app/services/post_service.dart';

class PostList extends StatefulWidget {
  PostService postService;
  PostList({super.key, required this.postService});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CreatePostCard(),
        StreamBuilder(
          stream: widget.postService.getPosts(),
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
                  return PostCard(
                      authorId: authorId,
                      authorName: authorName,
                      reactions: reactions,
                      text: text,
                      comments: comments);
                },
                itemCount: data.length);
          },
        ),
      ]),
    );
  }
}
