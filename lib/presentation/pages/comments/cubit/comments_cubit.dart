import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_code_brothers/models/comments_models.dart';
import 'package:the_code_brothers/services/data_service.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final _dataService = CommentsDataService();
  CommentsCubit() : super(CommentsLoading());

  void getComments() async {
    try {
      emit(CommentsLoading());
      List<CommentsInfo> list = await _dataService.getComments();
      emit(CommentsLoaded(list: list));
    } on SocketException {
      emit(CommentsError(error: "Internet connection error"));
    } catch (ex) {
      emit(CommentsError(error: "Something went wrong"));
    }
  }
}
