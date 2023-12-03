import 'package:flutter/material.dart';
import 'package:nmg_assignment/network_status/app_scaffold.dart';
import 'package:nmg_assignment/network_status/network_status_service.dart';
import 'package:nmg_assignment/routes/const_string_route_name.dart';
import 'package:nmg_assignment/views/posts/post_details_screen.dart';
import 'package:nmg_assignment/views/users/users_screen.dart';
import 'package:nmg_assignment/widgets/default_page.dart';
import 'package:nmg_assignment/widgets/network_confirmation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class Routes {

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    
    //1- this is user post route
      case RoutesUrl.userRouteUrl:
        return PageTransition(
          child: MultiProvider(providers: [
            StreamProvider<NetworkStatus>(
              create: (context) =>
                  NetworkStatusService().networkStatusController.stream,
              initialData: NetworkStatus.Online,
            )
          ], child: const AppScaffold(child: UsersScreen())),
          type: PageTransitionType.rightToLeft,
        );

      //1- this is user post details route
      case RoutesUrl.postRouteUrl:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: MultiProvider(
            providers: [
              StreamProvider<NetworkStatus>(
                create: (context) =>
                    NetworkStatusService().networkStatusController.stream,
                initialData: NetworkStatus.Online,
              )
            ],
            child: AppScaffold(
              child: PostDetailsScreen(
                  postId:arguments["postId"],
                  webSite:arguments["website"],
                  authorName:arguments["authorName"],
                 
              ),
            ),
          ),
          
          type: PageTransitionType.rightToLeft,
        );

    

    //1- this is internet confirmation route
      case RoutesUrl.intenetStatusRouteUrl:
        return PageTransition(
          child: const OfflineNetworkConfirmationWidgets(),
          type: PageTransitionType.fade,
        );

      default:
          //1- this is Default route
        return PageTransition(
          child: const DefaultScreen(),
          type: PageTransitionType.rightToLeft,
        );
    }
  }

}
