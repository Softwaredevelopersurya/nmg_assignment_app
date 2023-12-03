import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nmg_assignment/models/users_model.dart';
import 'package:nmg_assignment/services/api_service.dart';

class UsersApiProvider {
List <UserModel> userData=[];
  Future<List<UserModel>> getUsers() async {

   
    http.Response res = await http.get(Uri.parse(Apis.usersAPIUrl));

    try{
    if(res.statusCode==200){
     String responseBody =res.body;
     var jsonBody=json.decode(responseBody);

for(var data in jsonBody){
userData.add(UserModel(id: data["id"], name: data["name"], username: data["username"], email: data["email"], phone: data["phone"], website: data["website"]));
}
return userData;
    }else{
      return userData;
    }

      
    }
    catch(e,stacktrace){
     
      print("Exception occured: $e stackTrace: $stacktrace");
      return userData;
    }
  }


}
