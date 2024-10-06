import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/core/Utils/widgets/navBarWidget.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_events.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/signUp_model.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signUpView extends StatefulWidget {
  const signUpView({super.key});

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {
  var formKey = GlobalKey<FormState>();

  var userNameContoller = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationController = TextEditingController();

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
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)))
          ],
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pop(context);
            pushReplacement(context, navBarWidget());
          } else if (state is SignUpErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.signUpError)));
          } else if (state is SignUpLoadingState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Hello! Register to get started",
                      style: getHeadLineTextStyle(),
                    ),
                    Gap(50),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter your username";
                        } else {
                          return null;
                        }
                      },
                      controller: userNameContoller,
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                    Gap(15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter your email";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    Gap(15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter your password";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(hintText: "password"),
                    ),
                    Gap(15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please confirm your password";
                        } else {
                          return null;
                        }
                      },
                      controller: confirmationController,
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
                        text: "Sign Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(SignUpEvent(
                                SignUpModelParams(
                                    name: userNameContoller.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmationController.text)));
                          }
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
                              style: getSmallTextStyle(
                                  color: appColors.primaryColor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
