import 'package:flutter/material.dart';
import 'package:the_code_brothers/models/comments_models.dart';
import 'package:the_code_brothers/presentation/styles/app_typography.dart';
import 'package:the_code_brothers/presentation/styles/dimens.dart';

Widget createCommentViewItem(CommentsInfo comments, BuildContext context) {
  return ListTile(
    title: Card(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
        ),
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(Dimens.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name: " + comments.name,
              style: AppTypography.h1,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: Dimens.s,
            ),
            Text(
              "Email: " + comments.email,
              style: AppTypography.h2,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: Dimens.s,
            ),
            Container(
              padding: const EdgeInsets.all(Dimens.s),
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                comments.body,
                style: AppTypography.body2,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
