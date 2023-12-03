
import 'package:nmg_assignment/models/post_model.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_api_provider.dart';

class PostsRepository{

 final  _provider=PostsApiProvider();


  Future<PostModel> fetchPosts({postId}){
    return _provider.getPosts( postId);
  }
}


class NetworkErrorPosts extends Error {}