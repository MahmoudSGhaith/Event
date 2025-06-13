import 'package:event/core/common_widget/custom_text_form_field/custome_text_form_field.dart';
import 'package:event/core/resources/assets/assets_manger.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:event/modules/screens/main_layout/screens/home_tab/event_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../manger/layout_provider.dart';

class Love extends StatelessWidget {
  const Love({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayoutProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: CustomTextFormField(
                labelText: AppLocalizations.of(context)!.search_event,
                prefixIcon: Icons.search,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.favoriteEvents.length,
                itemBuilder: (context, index) {
                  return EventComponent(
                    imagePath: AssetsManger.sports,
                    event: provider.favoriteEvents[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
