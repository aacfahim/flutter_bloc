part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

abstract class PostActionState extends PostState {}

final class PostLoadingState extends PostState {}

class PostFetchSuccessfulState extends PostState {
  final List<PostModel> posts;

  PostFetchSuccessfulState({required this.posts});
}
