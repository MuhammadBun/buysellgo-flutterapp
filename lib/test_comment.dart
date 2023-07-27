import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';

class CommentReplyWidget extends StatefulWidget {
  const CommentReplyWidget({Key? key}) : super(key: key);

  @override
  _CommentReplyWidgetState createState() => _CommentReplyWidgetState();
}

class _CommentReplyWidgetState extends State<CommentReplyWidget> {
  @override
  Widget build(BuildContext context) {
    return CommentTreeWidget<Comment, Comment>(
      Comment(
          avatar: 'null',
          userName: 'null',
          content: 'felangel made felangel/cubit_and_beyond public '),
      [
        Comment(
            avatar: 'null',
            userName: 'null',
            content: 'A Dart template generator which helps teams'),
        Comment(
            avatar: 'null',
            userName: 'null',
            content: 'A Dart template generator which helps teams'),
        Comment(
            avatar: 'null',
            userName: 'null',
            content: 'A Dart template generator which helps teams'),
      ],
      treeThemeData: TreeThemeData(lineColor: Colors.green[500]!, lineWidth: 3),
      avatarRoot: (context, data) => PreferredSize(
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&usqp=CAU'),
        ),
        preferredSize: Size.fromRadius(18),
      ),
      avatarChild: (context, data) => PreferredSize(
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&usqp=CAU'),
        ),
        preferredSize: Size.fromRadius(12),
      ),
      contentChild: (context, data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'dangngocduc',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${data.content}',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey[700], fontWeight: FontWeight.bold),
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text('Like'),
                    SizedBox(
                      width: 24,
                    ),
                    Text('Reply'),
                  ],
                ),
              ),
            )
          ],
        );
      },
      contentRoot: (context, data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'dangngocduc',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${data.content}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text('Like'),
                    SizedBox(
                      width: 24,
                    ),
                    Text('Reply'),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
