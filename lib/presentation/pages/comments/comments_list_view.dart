import 'package:flutter/material.dart';
import 'package:the_code_brothers/models/models.dart';
import 'package:the_code_brothers/presentation/pages/widgets/single_comment_template.dart';

class CustomListView extends StatelessWidget {
  final List<CommentsInfo> comments;

  const CustomListView(this.comments, {Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, int currentIndex) {
        return createCommentViewItem(comments[currentIndex], context);
      },
    );
  }
}