import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'otp_verfication_screen.dart';

class phone_sign extends StatefulWidget {
  const phone_sign({super.key});

  @override
  State<phone_sign> createState() => _phone_signState();
}

class _phone_signState extends State<phone_sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/img.png',
              fit: BoxFit.fill,
            ),
            Container(
                margin: EdgeInsets.only(top: 115, left: 35),
                child: Text(
                  'HEY YOU!',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Color(0xffC416D7),
                  )),
                )),
            Container(
              margin: EdgeInsets.only(top: 160, left: 35),
              child: Text(
                'WHAT’S YOUR PHONE \nNUMBER ?',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffC416D7),
                        height: 1.0)),
              ),
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.065,
                    ),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (value) {},
                      cursorColor: Color(0x9fC416D7),
                      hintText: '000 00 00 00',
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.254,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => otpScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.3),
                        backgroundColor: Color(0x9fC416D7)),
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700)),
                    ))
              ],
            )
          ],
        ));
  }
}
