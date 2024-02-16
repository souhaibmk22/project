import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hi/screens/phone_sign_in.dart';

class selecte_location extends StatefulWidget {
  const selecte_location({super.key});

  @override
  State<selecte_location> createState() => _selecte_locationState();
}

class _selecte_locationState extends State<selecte_location> {
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String _yourlocation = "Your Location";
  String _textholder = "Set Location";
  String _currentAdress = "";
  bool _isLoading = false;

  Future<Position> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAdressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemarks[0];
      print(place);
      setState(() {
        _currentAdress = "${place.subLocality}, ${place.locality}";
      });
    } catch (e) {
      print("an error is here${e}");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.148,
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Text(
                'WELCOME',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Color(0xbd5036fa),
                    ),
                    height: 1.1),
              )),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: MediaQuery.of(context).size.width * 0.1),
            child: Text(
              'SET YOUR LOCATION',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xbd5036fa))),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.39),
              child: Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  height: 170,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 20, left: 11.58, right: 11.58),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.557),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              child: Icon(
                                Icons.location_on_rounded,
                                size: 25,
                                color: Color(0xffFF833D),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color(0xffFFE14D)),
                            ),
                            SizedBox(
                              width: 14.74,
                            ),
                            _isLoading
                                ? SpinKitThreeBounce(
                                    color: Color(0xbd5036fa), //0xbd5036fa
                                    size: 30,
                                    duration: Duration(milliseconds: 800),
                                  )
                                : Text(
                                    '${_yourlocation}',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Center(
                            child: ElevatedButton(
                                onPressed: () async {
                                  _currentLocation =
                                      await _getCurrentLocation();
                                  await _getAdressFromCoordinates();

                                  setState(() {
                                    if (_currentAdress.isNotEmpty) {
                                      _yourlocation = _currentAdress;
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        57),
                                    backgroundColor: Color(0xbd5036fa)),
                                child: Text(
                                  _textholder,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )),
                                )))
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}
