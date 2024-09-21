import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class welcomeView extends StatelessWidget {
  const welcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Image.asset("assets/images/logo.png"),
                  Gap(10),
                  Text(
                    "Order Your Book Now!",
                    style: getHeadLineTextStyle(),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Gap(40),
                  customButtonWidget(
                    color: appColors.primaryColor,
                    text: "Login",
                    onPressed: () {
                      push(context, loginView());
                    },
                  ),
                  Gap(15),
                  customButtonWidget(
                      isBorder: true,
                      textStyle: getBodyTextStyle(color: appColors.black),
                      text: "Register",
                      onPressed: () {},
                      color: appColors.whiteColor),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
