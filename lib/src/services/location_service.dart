import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hi/src/controller/location_controller.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:location/location.dart';

class LocationService {
  LocationService.init();

  static LocationService instance = LocationService.init();
  final Location _location = Location();

  Future<bool> checkForServiceAvailability() async {
    //check if the location service is enables in the phone or not
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }
    //this requests for user to enable the location service if it is enabled
    isEnabled = await _location.requestService();
    if (isEnabled) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> checkForPermission() async {
    //Checks if the app has permission to access location
    PermissionStatus status = await _location.hasPermission();
    if (status == PermissionStatus.denied) {
      //the app didn't have the permission
      status = await _location.requestPermission();
    }
    if (status == PermissionStatus.granted) {
      //Access to the location of the user :

      return Future.value(true);
    }
    if (status == PermissionStatus.deniedForever) {
      Get.snackbar('TowPal need to know your location',
          'we use permission to get your location in order to give your location',
          onTap: (snack) {
        //here the user will open the app setting to enable the location
        handler.openAppSettings();
      }).show();
      return Future.value(false);
    }
    return Future.value(false);
  }

  Future<void> getUserLocation({required LocationController controller}) async {
    controller.updateIsAccessingLocation(true);

    if (!(await checkForServiceAvailability())) {
      controller.errordescription.value = "Service not enabled";
      controller.updateIsAccessingLocation(false);
      return;
    }
    if (!(await checkForPermission())) {
      controller.errordescription.value = "Permission not given";
      controller.updateIsAccessingLocation(false);
      return;
    }
    final LocationData data = await _location.getLocation();
    controller.updateUserLocation(data);
    controller.isAccessingLocation(false);
  }
}
