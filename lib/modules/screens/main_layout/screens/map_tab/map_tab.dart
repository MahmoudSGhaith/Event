import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:event/core/resources/styles/styles_manger.dart';
import 'package:event/modules/screens/main_layout/screens/map_tab/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

late MapProvider mapProvider;

class _MapTabState extends State<MapTab> {


  @override
  Widget build(BuildContext context) {
    mapProvider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: Consumer<MapProvider>(
        builder: (context, provider, child) {
          return GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              provider.mapController = controller;
              provider.getLocation();
            },
            mapType: MapType.hybrid,
            initialCameraPosition: provider.initialCameraPosition,
            markers: provider.markers,
            circles: provider.circles,
          );
        },
      ),
    );
  }
}
