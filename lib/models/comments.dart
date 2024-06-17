class Comments {
  String id;
  String text;
  String authorId;
  int likes;
  List<String> replies;

  Comments(
      {required this.id,
      required this.text,
      required this.authorId,
      required this.likes,
      required this.replies});

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'text': text,
      'authorId': authorId,
      'likess': likes,
      'replies': replies
    };
  }
}
