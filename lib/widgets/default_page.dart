
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Page Not Found !",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
            
              height: 1.2,
              letterSpacing: .5,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
