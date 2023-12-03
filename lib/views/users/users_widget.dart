import 'package:flutter/material.dart';
import 'package:nmg_assignment/routes/const_string_route_name.dart';
import 'package:nmg_assignment/styles/text_style.dart';
import 'package:nmg_assignment/utils/extension.dart';


class UserWidget extends StatefulWidget {
  
  final String? dp;
  final String? website;
  final String? email;
  final String? postImgUrl;
  final int? id;
  final String? authorName;

  UserWidget({
    Key? key,
    @required this.dp,
    @required this.id,
    @required this.website,
    @required this.postImgUrl,
    @required this.email, 
    required this.authorName

  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: InkWell(
           
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${widget.dp}",
                    ),
                  ),
            
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    widget.authorName.toString().capitalize(),
             style:MyTestStyles.titleTextStyle,
                  ),
                  subtitle: Text(
                    widget.website.toString(),
               style:MyTestStyles.normalTextStyle,
                  )   ,
                  
                
                ),
             Container(
                height: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${widget.postImgUrl}"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ), 
            
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, RoutesUrl.postRouteUrl,arguments:{"postId":"${widget.id}","authorName":"${widget.authorName}","website":"${widget.website}"});
       
      },
          ),
        ),
      ),
    );
  }
}