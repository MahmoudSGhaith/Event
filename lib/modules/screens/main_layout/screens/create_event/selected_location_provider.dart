


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/resources/colors/colors_manger.dart';

class SelectedLocationProvider extends ChangeNotifier {



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

    initialCameraPosition = CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 17,
    );

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(initialCameraPosition),
    );
    markers = {
      Marker(markerId: MarkerId("1"),
          infoWindow: InfoWindow(title: "hello mahmoud"),
          position: LatLng(location.latitude , location.longitude))
    };
    notifyListeners();
  }

  LatLng? selectedLocation;

  changeSelectedLocation(LatLng newLocation){
    selectedLocation = newLocation;
    goToLocation(newLocation);
    notifyListeners();
  }

}