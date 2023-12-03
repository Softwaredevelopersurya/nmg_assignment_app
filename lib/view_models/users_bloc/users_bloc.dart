import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmg_assignment/view_models/users_bloc/users_events.dart';
import 'package:nmg_assignment/view_models/users_bloc/users_repository.dart';
import 'package:nmg_assignment/view_models/users_bloc/users_states.dart';

class UserBloc extends Bloc<UsersEvents, UsersStates> {
  UserBloc() : super(InitialUserState()) {
    final UsersRepository usersRepository = UsersRepository();

    on<UserEvent>((event, state) async {
      try {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(LoadingUserState());
        final mList = await usersRepository.fetchUsers();

        // ignore: invalid_use_of_visible_for_testing_member
        emit(LoadedUserState(usersData: mList));
      } on NetworkErrorUsers {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ErrorUserState(message: "Some thing went wrong !"));
      }
    });

    
  }
}
