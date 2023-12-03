import 'package:flutter/material.dart';
import 'package:nmg_assignment/widgets/network_confirmation_widget.dart';

import 'network_aware_widget.dart';


class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkAwareWidget(
          onlineChild: child,
          offlineChild:  const Center(
            child: OfflineNetworkConfirmationWidgets()
          )),
    );
  }
}