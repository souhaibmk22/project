import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
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
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.148,
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Text(
                'YOU ARE OFFICIALLY HERE AS A ?',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffC416D7)),
                    height: 1.0),
              )),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.26),
              child: Column(
                children: [
                  Container(
                      width: 241,
                      height: 224,
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  backgroundColor: Color(0x9fC416D7)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'tower.png',
                                    fit: BoxFit.fill,height: 100,
                                  ),
                                  Text(
                                    'Tower ',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w700)),
                                  )
                                ],
                              ))))
                ],
              ))
        ],
      ),
    );
  }
}
