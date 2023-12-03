import 'package:equatable/equatable.dart';
import 'package:nmg_assignment/models/users_model.dart';




abstract class UsersStates extends Equatable{
  const UsersStates();

  @override
  List<Object?> get props=>[];

}

class InitialUserState extends UsersStates{}

class LoadingUserState extends UsersStates{}


//state

// ignore: must_be_immutable
class LoadedUserState extends UsersStates{

  List<UserModel>? usersData=[];

  LoadedUserState({this.usersData});
}

// ignore: must_be_immutable
class ErrorUserState extends UsersStates{
  String message="";
  ErrorUserState({required this.message});
}



