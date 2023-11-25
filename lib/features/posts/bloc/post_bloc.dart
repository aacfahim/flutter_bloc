import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:techsell_bloc/features/posts/models/post_model.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostState> emit) async {
    var url = "https://jsonplaceholder.typicode.com/posts";

    var client = http.Client();

    try {
      emit(PostLoadingState());
      var response = await client.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<PostModel> posts = [];

        for (var i in data) {
          posts.add(PostModel.fromJson(i));
        }
        //print(posts.length);
        emit(PostFetchSuccessfulState(posts: posts));
      }
    } catch (e) {
      client.close();
      throw (e.toString());
    }
  }
}
