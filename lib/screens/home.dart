import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'phone_sign_in.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/img.png',
            fit: BoxFit.fill,
          ),
          Container(
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => phone_sign()));
              },
              child: Text(
                'Sign in with Phone number',
                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18)),
              ),
            )),
          )
        ],
      ),
    );
  }
}
