import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/core/Utils/widgets/navBarWidget.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_cards.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signUpView extends StatefulWidget {
  const signUpView({super.key});

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 41,
              width: 41,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: appColors.whiteColor,
                border: Border.all(color: appColors.accentColor),
              ),
              child: Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Hello! Register to get started",
                style: getHeadLineTextStyle(),
              ),
              Gap(50),
              TextField(
                decoration: InputDecoration(hintText: "Username"),
              ),
              Gap(15),
              TextField(
                decoration: InputDecoration(hintText: "Email"),
              ),
              Gap(15),
              TextField(
                decoration: InputDecoration(hintText: "password"),
              ),
              Gap(15),
              TextField(
                decoration: InputDecoration(hintText: "Confirm"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password ?",
                        style: getSmallTextStyle(),
                      ))
                ],
              ),
              Gap(25),
              customButtonWidget(
                  text: "Login",
                  onPressed: () {
                    pushReplacement(context, navBarWidget());
                  },
                  color: appColors.primaryColor),
              Gap(30),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(15),
                  Text(
                    "Or login with",
                    style: getSmallTextStyle(),
                  ),
                  Gap(15),
                  Expanded(child: Divider())
                ],
              ),
              Gap(30),
              Row(
                children: [
                  Expanded(
                      child: socialCards(
                    image: SvgPicture.asset("assets/icons/facebook.svg"),
                  )),
                  Gap(5),
                  Expanded(
                      child: socialCards(
                    image: SvgPicture.asset("assets/icons/google.svg"),
                  )),
                  Gap(5),
                  Expanded(
                      child: socialCards(
                    image: SvgPicture.asset("assets/icons/apple.svg"),
                  ))
                ],
              ),
              // Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Register Now",
                        style: getSmallTextStyle(color: appColors.primaryColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
