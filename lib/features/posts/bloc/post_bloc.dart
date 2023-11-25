import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:techsell_bloc/features/posts/models/post_model.dart';
import 'package:techsell_bloc/features/posts/repos/post_repo.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    List<PostModel> posts = await PostRepo.fetchPosts();
    emit(PostFetchSuccessfulState(posts: posts));
  }
}
