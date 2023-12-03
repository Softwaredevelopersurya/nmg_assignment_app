import 'package:flutter/material.dart';
import 'package:nmg_assignment/network_status/app_scaffold.dart';
import 'package:nmg_assignment/network_status/network_status_service.dart';
import 'package:nmg_assignment/routes/routes.dart';
import 'package:nmg_assignment/views/users/users_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NMG Assignment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
         onGenerateRoute: Routes.onGenerateRoute, 
 home:MultiProvider(
            providers: [
              StreamProvider<NetworkStatus>(
                create: (context) =>
                    NetworkStatusService().networkStatusController.stream,
                initialData: NetworkStatus.Online,
              )
            ],
            child: AppScaffold(
              child: UsersScreen(),
            ),
          ),);
          
 
  
      
   
  }
}
