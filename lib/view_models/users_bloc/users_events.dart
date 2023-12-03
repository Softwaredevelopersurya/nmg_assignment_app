//this events class

abstract class UsersEvents {
}

class UserEvent extends UsersEvents{

  UserEvent();
}


class LocallySearchUserEvent extends UsersEvents{
  String? searchText;
  LocallySearchUserEvent({this.searchText});

}


