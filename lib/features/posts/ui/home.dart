import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techsell_bloc/features/posts/bloc/post_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      bloc: postBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      listenWhen: (previous, current) => current is PostActionState,
      buildWhen: (previous, current) => current is! PostActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case PostFetchSuccessfulState:
            final successState = state as PostFetchSuccessfulState;
            return Scaffold(
              body: ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                  return Text(successState.posts[index].title.toString());
                },
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
