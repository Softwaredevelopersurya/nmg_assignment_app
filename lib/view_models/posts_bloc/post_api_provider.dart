import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nmg_assignment/models/post_model.dart';
import 'package:nmg_assignment/services/api_service.dart';

class PostsApiProvider {

  Future<PostModel> getPosts(postId) async {

   
    http.Response res = await http.get(Uri.parse('${Apis.postsAPIUrl}${int.parse(postId.toString())}'));

    try{
      print("crn bloc res----"+res.body.toString());
     
      return PostModel.fromJson(jsonDecode(res.body));
    }
    catch(e,stacktrace){
      Map<String, dynamic> parsor = jsonDecode(res.body);
      print("Exception occured: $e stackTrace: $stacktrace");
      return PostModel.fromJson(parsor);
    }
  }


}
