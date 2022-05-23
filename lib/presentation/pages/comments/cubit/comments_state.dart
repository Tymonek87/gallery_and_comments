part of 'comments_cubit.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  CommentsLoaded({required this.list});
  List<CommentsInfo> list;
}

class CommentsError extends CommentsState {
  CommentsError({required this.error});
  String error;
}
