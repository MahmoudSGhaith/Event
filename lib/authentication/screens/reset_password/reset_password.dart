
import 'package:animate_do/animate_do.dart';
import 'package:event/authentication/auth_provider/auth_provider.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/common_widget/custom_blue_button/custom_blue_button.dart';
import '../../../core/common_widget/custom_text_form_field/custome_text_form_field.dart';
import '../../../core/resources/assets/assets_manger.dart';
import '../../../l10n/app_localizations.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.reset_password),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.015),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  ZoomIn(
                    child: Center(
                      child: Image(
                        image: AssetImage(AssetsManger.resetPassword),
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: provider.emailController,
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Center(
                    child: CustomBlueButton(
                      isLoading: provider.isLoading,
                      title: AppLocalizations.of(context)!.reset_password,
                      onClick: (){
                        provider.resetPassword(context);
                      },

                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
