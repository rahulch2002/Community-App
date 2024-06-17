import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  String authorId;
  String authorName;
  Map<int, int> reactions;
  List<Map<String, String>> comments;
  String text;
  bool showComments;

  PostCard(
      {super.key,
      required this.authorId,
      required this.authorName,
      required this.reactions,
      required this.text,
      required this.comments,
      this.showComments = false});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Feed'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with author's profile image URL
                ),
                title: Text('Author Name'),
                subtitle: Text('Posted on: 5 minutes ago'),
              ),
              DescriptionTextWidget(
                  text:
                      """For targeting the majority audience in the Indian market, a differentiated marketing approach would likely be the most effective strategy for Zeruri Clothing. Here's why: 
                Broad Appeal: Differentiated marketing allows Zeruri Clothing to cater to the diverse preferences and needs of the majority audience while still maintaining a broad appeal. India's population is incredibly diverse, comprising people with varying tastes, lifestyles, and fashion sensibilities. By offering a range of products and marketing messages tailored to different segments within the majority audience, Zeruri Clothing can effectively capture a larger market share.
            
                Customization: With differentiated marketing, Zeruri Clothing can customize its products and marketing efforts to resonate with different segments of the majority audience. For example, the brand can offer a mix of casual wear, formal wear, and ethnic wear to cater to the varied wardrobe requirements of Indian consumers. By understanding and addressing the specific preferences of different consumer segments, Zeruri Clothing can enhance its relevance and appeal to the majority audience.
            
                Competitive Advantage: Differentiated marketing allows Zeruri Clothing to stand out from competitors by offering unique value propositions tailored to specific consumer segments. By focusing on innovation, quality, and customer experience across different product lines, Zeruri Clothing can differentiate itself in a crowded market and attract a larger share of the majority audience.
            
                Flexibility: Differentiated marketing provides flexibility for Zeruri Clothing to adjust its strategies based on changing market trends and consumer preferences. As the Indian fashion landscape evolves, Zeruri Clothing can pivot its product offerings and marketing messages to stay relevant and maintain its connection with the majority audience.
            
            Overall, a differentiated marketing approach offers the best balance between targeting the majority audience in the Indian market and accommodating the diverse needs and preferences within that audience. By leveraging this strategy effectively, Zeruri Clothing can maximize its market penetration and establish a strong brand presence in India."""),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('15 Reactions 😁👍👏🏿'),
                    Text('2 Comments 💬')
                  ],
                ),
              ),
              Padding(
                child: Divider(),
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.thumb_up_alt_outlined),
                            ),
                            Text('Like')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PostCard(
                                  authorId: widget.authorId,
                                  authorName: widget.authorName,
                                  reactions: widget.reactions,
                                  text: widget.text,
                                  showComments: true,
                                )));
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.comment_outlined),
                            ),
                            Text('Comment')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.share_outlined),
                            ),
                            Text('Share')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.showComments)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Divider(),
                      CommentWidget(
                          author: 'Commenter 1', comment: 'This is a comment.'),
                      CommentWidget(
                          author: 'Commenter 2',
                          comment: 'This is another comment.'),
                      // Add more comments here or dynamically load them
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String author;
  final String comment;

  CommentWidget({required this.author, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Replace with commenter's profile image URL
            radius: 15.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: new Text(
                          flag ? "show more" : "show less",
                          style: new TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
