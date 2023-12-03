import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nmg_assignment/models/users_model.dart';
import 'package:nmg_assignment/styles/text_style.dart';
import 'package:nmg_assignment/view_models/users_bloc/users_bloc.dart';
import 'package:nmg_assignment/view_models/users_bloc/users_events.dart';
import 'package:nmg_assignment/view_models/users_bloc/users_states.dart';
import 'package:nmg_assignment/views/users/users_widget.dart';
import 'package:nmg_assignment/widgets/Alertconfirmation.dart';
import 'package:nmg_assignment/widgets/simmer_widgets.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {


final UserBloc userBloc=UserBloc();

@override
  void initState() {
    // TODO: implement initState
userBloc.add(UserEvent());

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>userBloc),
        ],
      child:WillPopScope(
      onWillPop: () => AlertConfirmation.exitAppAlertDialog(context),
      
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 4,
            title: Text('Posts',style:MyTestStyles.titleTextStyle,),
          ),
          body:  BlocBuilder<UserBloc,UsersStates>(
           
                        builder:(context,state){
                         
          if( state is LoadingUserState)
          {
           return SimmerLoader.simmerLoaderWidget();
          }
           
          
          else if( state is LoadedUserState)
          {
          
         return AnimationLimiter(
      
           child: ListView.builder(
            physics: BouncingScrollPhysics(),
                itemCount: state.usersData!.length, // Replace with the actual number of cart items
                itemBuilder: (context, index) {
         
                  return
                  
                  AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: postBodyWidget(state.usersData,index),
                ),
              ),
            );
                  
                   
                },
              ),
         );
          }
        
          else {
        return Center(child: const Text("Some Thing Went Wrong2"));
          }
        
          }),
         
        ),
      ),
    );
  }
  
  // this pos

  Widget postBodyWidget(List<UserModel>? usersData, int index){
    return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: UserWidget(
                    dp: "https://cdn-icons-png.flaticon.com/128/9479/9479145.png?ga=GA1.1.235147881.1701520239&semt=ais",
                    postImgUrl: "https://img.freepik.com/free-photo/creative-copywriting-commercial-text-seo-editing_107791-15687.jpg?size=626&ext=jpg&ga=GA1.1.235147881.1701520239&semt=sph",
                    email:usersData?[index].email.toString(),
                    website: usersData?[index].website.toString(),
                    authorName:usersData?[index].name.toString(),
                    id:usersData?[index].id,
                  ),
                );
  }
  
  }