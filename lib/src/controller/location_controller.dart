import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final RxBool isAccessingLocation = RxBool(false);
  final RxString errordescription = RxString("");

  final Rx<LocationData?> userlocation = Rx<LocationData?>(null);

  void updateIsAccessingLocation(bool b) {
    isAccessingLocation.value = b;
  }

  void updateUserLocation(LocationData data) {
    userlocation.value = data;
  }
}
