import 'package:animate_do/animate_do.dart';
import 'package:event/authentication/auth_provider/auth_provider.dart';
import 'package:event/core/resources/assets/assets_manger.dart';
import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/common_widget/change_app_language/change_app_language.dart';
import '../../../core/common_widget/custom_blue_button/custom_blue_button.dart';
import '../../../core/common_widget/custom_text_form_field/custome_text_form_field.dart';
import '../../../core/common_widget/custom_under_line_text/custom_under_line_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenHeight * 0.02,
          ),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: context.screenHeight * 0.02),
                  ZoomIn(
                    child: Center(
                      child: Image(
                        image: AssetImage(AssetsManger.eventlyLogo),
                        width: context.screenWidth * 0.3,
                        height: context.screenHeight * 0.3,
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //CustomTextFormField for email
                  CustomTextFormField(
                    controller: provider.emailController,
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //CustomTextFormField for password
                  CustomTextFormField(
                    controller: provider.passwordController,
                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon: Icons.lock,
                    suffixIcon:
                        isSecure ? Icons.visibility_off : Icons.visibility,
                    isSecure: isSecure,
                    onClick: () {
                      showPassword();
                    },
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //Forget Password
                  CustomUnderLineText(
                    title: context.localization.forget_password,
                    onClick: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.resetPassword,
                      );
                    },
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //login button
                  Center(
                    child: CustomBlueButton(
                      isLoading: provider.isLoading,
                      title: AppLocalizations.of(context)!.login,
                      onClick: () async{
                       await provider.logIn(context);
                      },
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //not have account and create account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.do_not_have_an_account,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(fontSize: 14),
                      ),
                      CustomUnderLineText(
                        title: AppLocalizations.of(context)!.create_account,
                        onClick: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.register,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //or
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        color: ColorsManger.primary,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.or,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //login with google
                  InkWell(
                    onTap: () {
                      provider.signInWithGoogle(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        border: Border.all(color: ColorsManger.primary),
                      ),
                      width: double.infinity,
                      height: context.screenHeight * 0.09,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(AssetsManger.google),
                            width: context.screenWidth * 0.1,
                          ),
                          SizedBox(width: context.screenWidth * 0.02),
                          Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  ChangeAppLanguage(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void showPassword() {
    isSecure = !isSecure;
    setState(() {});
  }
}
