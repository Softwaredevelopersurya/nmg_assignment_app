import 'package:equatable/equatable.dart';
import 'package:nmg_assignment/models/post_model.dart';





abstract class PostsStates extends Equatable{
  const PostsStates();

  @override
  List<Object?> get props=>[];

}

class InitialPostState extends PostsStates{}

class LoadingPostState extends PostsStates{}


//state

// ignore: must_be_immutable
class LoadedPostState extends PostsStates{
  PostModel? postData;

  LoadedPostState({this.postData});
}

// ignore: must_be_immutable
class ErrorPostState extends PostsStates{
  String message="";
  ErrorPostState({required this.message});
}



