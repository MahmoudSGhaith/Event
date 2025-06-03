import 'package:animate_do/animate_do.dart';
import 'package:event/authentication/auth_provider/auth_provider.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/common_widget/change_app_language/change_app_language.dart';
import '../../../core/common_widget/custom_blue_button/custom_blue_button.dart';
import '../../../core/common_widget/custom_text_form_field/custome_text_form_field.dart';
import '../../../core/common_widget/custom_under_line_text/custom_under_line_text.dart';
import '../../../core/resources/assets/assets_manger.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late bool showPasswordSecure = true;
  late bool showRePasswordSecure = true;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  String regx =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenHeight * 0.015,
          ),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Form(
                  key: form,
                  child: Column(
                    children: [
                      ZoomIn(
                        child: Center(
                          child: Image(
                            image: AssetImage(AssetsManger.eventlyLogo),
                            width: context.screenWidth * 0.28,
                            height: context.screenHeight * 0.28,
                          ),
                        ),
                      ),
                      //CustomTextFormField for name
                      CustomTextFormField(
                        labelText: context.localization.name,
                        controller: provider.nameController,
                        prefixIcon: Icons.person,
                        //todo : name validation
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context
                                .localization
                                .the_name_field_is_required;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      //CustomTextFormField for email
                      CustomTextFormField(
                        labelText: AppLocalizations.of(context)!.email,
                        controller: provider.emailController,
                        prefixIcon: Icons.email,
                        //todo : email validation
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(regx).hasMatch(value)) {
                            return context
                                .localization
                                .the_email_field_is_required;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      //CustomTextFormField for password
                      CustomTextFormField(
                        labelText: AppLocalizations.of(context)!.password,
                        controller: provider.passwordController,
                        prefixIcon: Icons.lock,
                        //todo : password validation
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context
                                .localization
                                .the_password_field_is_required;
                          } else if (value.length < 8) {
                            return context
                                .localization
                                .password_should_be_at_least_8_characters;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon:
                            showPasswordSecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                        isSecure: showPasswordSecure,
                        onClick: showPassword,
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      //CustomTextFormField for re_password
                      CustomTextFormField(
                        labelText: AppLocalizations.of(context)!.re_password,
                        controller: provider.rePasswordController,
                        prefixIcon: Icons.lock,
                        //todo : re_password validation
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context
                                .localization
                                .the_repassword_field_is_required;
                          } else if (value !=
                              provider.passwordController.text) {
                            return context
                                .localization
                                .password_and_confirm_password_must_be_same;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon:
                            showRePasswordSecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                        isSecure: showRePasswordSecure,
                        onClick: showRePassword,
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      //todo: IMPORTANT ==> DO NOT FORGET ENABLE AUTHENTICATION FROM FIREBASE
                      //todo: Firebase .. build .. Authentication .. sign_in method tab .. choose any provider
                      CustomBlueButton(
                        isLoading: provider.isLoading,
                        title: AppLocalizations.of(context)!.create_account,
                        onClick: ()async{
                          if (form.currentState!.validate()) {
                            await provider.createAccount(context);
                          }
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.already_have_account,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          CustomUnderLineText(
                            title: AppLocalizations.of(context)!.login,
                            onClick: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.login,
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.012),
                      ChangeAppLanguage(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void showPassword() {
    showPasswordSecure = !showPasswordSecure;
    setState(() {});
  }

  void showRePassword() {
    showRePasswordSecure = !showRePasswordSecure;
    setState(() {});
  }
}
