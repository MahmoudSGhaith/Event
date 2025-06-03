import 'package:event/core/resources/extension/extension.dart';
import 'package:event/modules/screens/main_layout/screens/create_event/selected_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/colors/colors_manger.dart';
import '../../../../../core/resources/styles/styles_manger.dart';
import '../../../../../l10n/app_localizations.dart';

class SelectedLocation extends StatelessWidget {
  const SelectedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectedLocationProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Consumer<SelectedLocationProvider>(
                builder: (context, provider, child) {
                  return GoogleMap(
                    onMapCreated: (controller) {
                      provider.mapController = controller;
                    },
                    onTap: (LatLng latLng) {
                      provider.changeSelectedLocation(latLng);
                      Navigator.pop(context , provider.selectedLocation);
                    },
                    initialCameraPosition: provider.initialCameraPosition,
                    markers: provider.markers,
                  );
                },
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ColorsManger.black , width: 2),
                  color: ColorsManger.grey.withAlpha(200),
                ),
                alignment: Alignment.center,
                width: context.screenWidth*0.7,
                height: context.screenHeight * 0.06,
                child: Text(
                  AppLocalizations.of(context)!.tap_on_Location_To_Select,
                  style: StylesManger.bold15white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
