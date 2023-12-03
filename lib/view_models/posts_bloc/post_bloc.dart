import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmg_assignment/models/post_model.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_events.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_repository.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_states.dart';

class PostsBloc extends Bloc<PostsEvents, PostsStates> {
  PostsBloc() : super(InitialPostState()) {
    final PostsRepository postsRepository = PostsRepository();

    PostModel? postData;

    on<PostEvent>((event, state) async {
      try {
        print(" Post BB");

        // ignore: invalid_use_of_visible_for_testing_member
        emit(LoadingPostState());
        final mList = await postsRepository.fetchPosts(postId: event.postId);
        postData = mList;

        // ignore: invalid_use_of_visible_for_testing_member
        emit(LoadedPostState(postData: postData));
      } on NetworkErrorPosts {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ErrorPostState(message: "Some thing went wrong !"));
      }
    });
  }
}
