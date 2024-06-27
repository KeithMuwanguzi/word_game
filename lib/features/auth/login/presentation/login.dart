import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_game/core/firebase_service.dart';
import 'package:word_game/core/utils/font_styles.dart';
import 'package:word_game/core/utils/size_utils.dart';
import 'package:word_game/features/auth/login/controllers/controller.dart';
import 'package:word_game/widgets/custom_buttom.dart';
import 'package:word_game/widgets/custom_elevated_button.dart';
import 'package:word_game/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: (deviceType == DeviceType.tablet)
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Welcome to the Word Game',
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 24.fSize),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: LoginForm(
                        controller: controller,
                        pad: 50.h,
                        deviceType: DeviceType.tablet,
                      ),
                    ),
                  ],
                )
              : (deviceType == DeviceType.mobile)
                  ?
                  // Mobile layout
                  Center(
                      child: LoginForm(
                        controller: controller,
                        pad: 35.h,
                        deviceType: DeviceType.mobile,
                      ),
                    )
                  : const Center(
                      child: Text("Under Development"),
                    ),
        );
      },
    );
  }
}

class LoginForm extends StatelessWidget {
  final LoginController controller;
  final double pad;
  final DeviceType deviceType;
  const LoginForm({
    super.key,
    required this.controller,
    required this.pad,
    required this.deviceType,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(pad, 30.v, pad, 10.v),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  " Welcome Back",
                  style: GoogleFonts.roboto(
                    fontSize: getLargeFont(deviceType),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    " Today is a new day, It's your day. You shape it\n Sign in to start your word game journey",
                    style: GoogleFonts.roboto(
                      fontSize: getSmallFont(deviceType),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.v),
            Form(
              key: controller.key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NormalTextField(
                      controller: controller.email,
                      hintText: "johndoe@example.com",
                      labelText: "Email",
                      validate: controller.validateEmail,
                      height: getFieldSize(deviceType),
                      textStyle: GoogleFonts.roboto(
                        fontSize: getSmallFont(deviceType),
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Obx(
                      () => PasswordTextField(
                        controller: controller.password,
                        function: () => controller.changeVisibility(),
                        hintText: '**********',
                        labelText: 'Password',
                        height: getFieldSize(deviceType),
                        textStyle: GoogleFonts.roboto(
                          fontSize: getSmallFont(deviceType),
                        ),
                        validate: controller.validatePassword,
                        iconSize: getSmallSizes(deviceType),
                        isPassword: controller.isVisible.value,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?  ',
                            style: GoogleFonts.roboto(
                              color: Colors.blue,
                              fontSize: getUltraSmallFont(deviceType),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.v),
                    CustomButton(
                      text: 'Sign In',
                      height: getButtonSize(deviceType),
                      onPressed: () {
                        if (controller.key.currentState!.validate()) {
                          AuthController.instance.signIn(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                        }
                      },
                      textStyle: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: getSmallFont(deviceType),
                      ),
                    ),
                    SizedBox(height: 25.v),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        SizedBox(width: 15.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Or',
                            style: GoogleFonts.roboto(
                              fontSize: getSmallFont(deviceType),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.h),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20.v),
                    // _buildSocialButtonsSection(deviceType),
                    CustomElevatedButton(
                      text: "Sign in with Google",
                      size: getSmallFont(deviceType),
                      height: getSocialButtonHeight(deviceType),
                      width: getSocialButtonWidth(deviceType),
                      leftIcon: Image.asset(
                        'assets/images/google.png',
                        height: getMediumSizes(deviceType),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    CustomElevatedButton(
                      text: "Sign in with Twitter",
                      size: getSmallFont(deviceType),
                      height: getSocialButtonHeight(deviceType),
                      width: getSocialButtonWidth(deviceType),
                      leftIcon: Image.asset(
                        'assets/images/x.png',
                        height: getMediumSizes(deviceType),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.roboto(
                            fontSize: getUltraSmallFont(deviceType),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.key.currentState!.validate()) {
                              AuthController.instance.signUp(
                                  controller.email.text.trim(),
                                  controller.password.text.trim());
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.roboto(
                              fontSize: getSmallFont(deviceType),
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
