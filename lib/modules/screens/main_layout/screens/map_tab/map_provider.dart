import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapProvider extends ChangeNotifier {
  Location location = Location();
  String locationMessage = "check Location";

  getLocation() async {
    // function for check permission
    bool isPermissionEnabled = await _checkPermissionEnabled();
    if (isPermissionEnabled == false) {
      locationMessage = "check permission denied";
      notifyListeners();
      return;
    }
    // function for check service locator enable or no
    bool isServiceEnabled = await _checkServiceEnable();
    if (isServiceEnabled == false) {
      locationMessage = "check service Locator denied";
      notifyListeners();
      return;
    }
    LocationData currentLocation = await location.getLocation();
    // function for going to my location
    goToLocation(LatLng(currentLocation.latitude??0, currentLocation.longitude??0));

  }

  // function for check permission
  Future<bool> _checkPermissionEnabled() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    notifyListeners();
    return permissionStatus == PermissionStatus.granted;
  }

  // function for check service locator enable or no
  Future<bool> _checkServiceEnable() async {
    bool serviceEnable = await location.serviceEnabled();
    if (!serviceEnable) {
      serviceEnable = await location.requestService();
    }
    notifyListeners();
    return serviceEnable;
  }

  // function for show initial location in map
  CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(31.077220438728336, 31.40197809205762),
    zoom: 17,
    tilt: 60.440717697143555,
  );

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.077220438728336, 31.40197809205762),
      infoWindow: InfoWindow(title: "HelloMahmoud"),
    ),
  };

  Set<Circle> circles = {
    Circle(
      circleId: CircleId("1"),
      strokeColor: ColorsManger.white,
      center: LatLng(31.077220438728336, 31.40197809205762),
      radius: 100,
    ),
  };

  late GoogleMapController mapController;

  goToLocation(LatLng location) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(location.latitude, location.longitude), zoom: 17),
      ),
    );
    markers = {
      Marker(markerId: MarkerId("1"),
          infoWindow: InfoWindow(title: "hello mahmoud"),
          position: LatLng(location.latitude , location.longitude))
    };
    notifyListeners();
  }

  streamLocation(){
    location.onLocationChanged.listen((newLocation) {
      goToLocation(LatLng(newLocation.latitude??0, newLocation.longitude??0));
    },);
  }

}
