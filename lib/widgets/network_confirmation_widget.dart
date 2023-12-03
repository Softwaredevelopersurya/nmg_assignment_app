import 'package:flutter/material.dart';
import 'package:nmg_assignment/styles/text_style.dart';
import 'package:nmg_assignment/widgets/Alertconfirmation.dart';

class OfflineNetworkConfirmationWidgets extends StatelessWidget {
  const OfflineNetworkConfirmationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Issues'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_off,
              size: 80,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Network Connection Issues',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'We are unable to establish a network connection. Please check your internet connection and try again.',
                textAlign: TextAlign.center,
                style: MyTestStyles.subTitleTextStyle,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Implement retry logic here
                // For example, you can use a function to retry the network operation.
                Navigator.pop(context);
              },
              child: Text('Try Again',style:MyTestStyles.subTitleTextStyle,),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implement exit logic here
                // For example, you can use Navigator.pop(context) to close the screen.
                AlertConfirmation.exitAppAlertDialog(context);
              },
              child: Text('Exit',style:MyTestStyles.subTitleTextStyle,),
            ),
          ],
        ),
      ),
    );
  }
}