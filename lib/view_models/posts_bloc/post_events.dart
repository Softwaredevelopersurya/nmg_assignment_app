//this events class
abstract class PostsEvents {
}

class PostEvent extends PostsEvents{
  var postId;
  PostEvent({required this.postId});
}


class LocallySearchPostEvent extends PostsEvents{
  String? searchText;
  LocallySearchPostEvent({this.searchText});

}


