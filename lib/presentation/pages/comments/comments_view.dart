import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show get;
import 'package:the_code_brothers/data/api_routes.dart';
import 'package:the_code_brothers/models/comments_models.dart';
import 'package:the_code_brothers/presentation/pages/comments/comments_cubit.dart';
import 'package:the_code_brothers/presentation/pages/widgets/comments_list_view.dart';

class CommentsView extends StatelessWidget {
  final String title;
  const CommentsView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
          body: Center(child: BlocBuilder<CommentsCubit, List<CommentsInfo>>(
            builder: ((context, comments) {
              if (comments.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CommentsListView(comments);
            }),
          )),
        ),
      ),
    );
  }
}
