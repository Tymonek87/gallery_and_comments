import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_code_brothers/models/comments_models.dart';

import 'package:the_code_brothers/services/data_service.dart';


class CommentsCubit extends Cubit<List<CommentsInfo>> {
  final _dataService = CommentsDataService();

  CommentsCubit() : super([]);

  void getComments() async => emit(await _dataService.getComments());
}