import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nmg_assignment/views/users/users_widget.dart';
import 'package:shimmer/shimmer.dart';


//this Simmer loader class

class SimmerLoader{

static  simmerLoaderWidget()=>AnimationLimiter(
  child: ListView.builder(
    itemCount: 8,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      
      return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.white,
        child: AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 300),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
                child:UserWidget(
                    dp: "https://img.freepik.com/free-photo/portrait-happy-male-with-broad-smile_176532-8175.jpg?size=626&ext=jpg&ga=GA1.1.235147881.1701520239&semt=sph",
                    postImgUrl: "https://img.freepik.com/free-photo/beautiful-manhattan-bridge-new-york-usa_181624-48458.jpg?t=st=1701524367~exp=1701524967~hmac=a022827a6cfa502bade04ebf6a053c65d1478ab20bf8aea173217d94b7ffe2da",
                    email:'Sincere@april.biz',
                    website: 'Antonette',
                    authorName:"Leanne Graham",
                    id:index+1,
                  ),
          ),
        ),
      )    );},
  ),
);

}
