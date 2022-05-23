import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_code_brothers/presentation/pages/comments/cubit/comments_cubit.dart';
import 'package:the_code_brothers/presentation/pages/widgets/comments_list_view.dart';
import 'package:the_code_brothers/presentation/pages/widgets/error_view.dart';

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
          body: Center(child: BlocBuilder<CommentsCubit, CommentsState>(
            builder: ((context, state) {
              if (state is CommentsLoaded) {
                return CommentsListView(state.list);
              }
              if (state is CommentsError) {
                return ErrorView(
                  message: state.error,
                  function: context.read<CommentsCubit>().getComments,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          )),
        ),
      ),
    );
  }
}
