





import 'package:nmg_assignment/view_models/users_bloc/users_api_provider.dart';
import 'package:nmg_assignment/models/users_model.dart';

class UsersRepository{

 final  _provider=UsersApiProvider();


  Future<List<UserModel>> fetchUsers(){
    return _provider.getUsers();
  }
}


class NetworkErrorUsers extends Error {}