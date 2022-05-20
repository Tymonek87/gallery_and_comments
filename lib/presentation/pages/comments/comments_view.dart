import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:the_code_brothers/data/api_routes.dart';
import 'dart:convert';

import 'package:the_code_brothers/models/models.dart';

import 'package:the_code_brothers/presentation/pages/comments/comments_list_view.dart';




Future<List<CommentsInfo>> downloadJSON() async {
  final uri = Uri.https(ApiRoutes.baseUrl,ApiRoutes.comments);

  final response = await get(uri);

  if (response.statusCode == 200) {
    List comments = json.decode(response.body);
    return comments.map((comments) => CommentsInfo.fromJson(comments)).toList();
  } else {
    throw Exception('We were not able to successfully download the json data.');
  }
}

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
          body: Center(
            child: FutureBuilder<List<CommentsInfo>>(
              future: downloadJSON(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CommentsInfo>? comments = snapshot.data;
                  return CustomListView(comments!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
