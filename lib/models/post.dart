class Post {
  String postId;
  String text;
  String senderId;
  DateTime timestamp;
  Map<String, int> reactions;
  List<String> comments;
  List<String> mediaFiles; // firestore storage path to files

  Post(
      {required this.comments,
      required this.mediaFiles,
      required this.postId,
      required this.text,
      required this.timestamp,
      required this.senderId,
      required this.reactions});

  Map<String, dynamic> toJson() {
    return {
      'comments': comments,
      'postId': postId,
      'senderId': senderId,
      'timestamp': timestamp,
      'text': text,
      'reactions': reactions,
      'mediaFiles': mediaFiles
    };
  }
}
