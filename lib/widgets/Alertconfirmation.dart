import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nmg_assignment/styles/colors.dart';
import 'package:nmg_assignment/styles/text_style.dart';

class AlertConfirmation{
  static exitAppAlertDialog(BuildContext context) async {
  
   
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Confirmation',
            style: MyTestStyles.titleTextStyle,
          ),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            "Do you want to exit an App ?",
            style:MyTestStyles.subTitleTextStyle,
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(MyColors.whiteColor),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      MyColors.grey,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color:  MyColors.grey,
                            )))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: MyTestStyles.subTitleTextStyle,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>( MyColors.whiteColor),
                    backgroundColor: MaterialStateProperty.all<Color>(
                       MyColors.grey,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color:MyColors.grey,
                            )))),
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: Text(
                  'Yes',
                  style: MyTestStyles.subTitleTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}