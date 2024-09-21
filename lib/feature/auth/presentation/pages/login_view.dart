import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/core/Utils/widgets/navBarWidget.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_events.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/login_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/repo/auth_repo.dart';
import 'package:bookia_app/feature/auth/presentation/pages/signUp_view.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            pushReplacement(context, navBarWidget());
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    "Welcome Back! Glad to see you Again!",
                    style: getHeadLineTextStyle(),
                  ),
                  Gap(50),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter your Email";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Enter Your Email"),
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
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            "assets/icons/eye.svg",
                            width: 40,
                            height: 30,
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 50,
                        )),
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
                  (state is LoginLoadingState)
                      ? const CircularProgressIndicator()
                      : customButtonWidget(
                          text: "Login",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(LoginEvent(
                                  LoginModelParams(
                                      email: emailController.text,
                                      password: passwordController.text)));
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
                  Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            push(context, signUpView());
                          },
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
          );
        },
      ),
    );
  }
}
