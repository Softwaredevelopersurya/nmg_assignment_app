import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmg_assignment/models/post_model.dart';
import 'package:nmg_assignment/styles/text_style.dart';
import 'package:nmg_assignment/utils/extension.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_bloc.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_events.dart';
import 'package:nmg_assignment/view_models/posts_bloc/post_states.dart';
import 'package:nmg_assignment/widgets/simmer_widgets.dart';

// ignore: must_be_immutable
class PostDetailsScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var postId;
  // ignore: prefer_typing_uninitialized_variables
  var authorName;
  // ignore: prefer_typing_uninitialized_variables
  var webSite;
  PostDetailsScreen({super.key, this.postId,this.authorName,this.webSite});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    // TODO: implement initState
    postsBloc.add(PostEvent(postId:widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => postsBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          
          leading: GestureDetector(onTap:()=>Navigator.pop(context), child: Icon(Icons.arrow_back_ios)),
          elevation: 4,
          centerTitle: true,
          title: Text('Post Details',style:MyTestStyles.titleTextStyle,),
        ),
        body: BlocBuilder<PostsBloc, PostsStates>(builder: (context, state) {
          if (state is LoadingPostState) {
            return SimmerLoader.simmerLoaderWidget();
          } else if (state is LoadedPostState) {
            return postDetailsBody(state.postData);
          } else {
            return Center(child:  Text("Data Not Fout !",style:MyTestStyles.subTitleTextStyle));
          }
        }),
      ),
    );
  }

  Widget postDetailsBody(PostModel? postData) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Image
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/creative-copywriting-commercial-text-seo-editing_107791-15687.jpg?size=626&ext=jpg&ga=GA1.1.235147881.1701520239&semt=sph'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),

          SizedBox(height: 16.0),

          // Post Title
          Text(
            "${postData?.title.toString().capitalize()}",
            style:MyTestStyles.titleTextStyle,
          ),

          SizedBox(height: 8.0),

          // Post Date and Author
          Row(
            children: [
              Icon(Icons.web, size: 16.0),
              SizedBox(width: 4.0),
              Text('${widget.webSite.toString().capitalize()}',style:MyTestStyles.normalTextStyle,),
              SizedBox(width: 16.0),
              Icon(Icons.person, size: 16.0),
              SizedBox(width: 4.0),
              Text('${widget.authorName.toString().capitalize()}',style:MyTestStyles.normalTextStyle,),
            ],
          ),

          SizedBox(height: 16.0),

          // Post Content
          Text(
            '${postData?.body.toString().capitalize()}',
        style:MyTestStyles.subTitleTextStyle,
          ),
        ],
      ),
    );
  }
}
