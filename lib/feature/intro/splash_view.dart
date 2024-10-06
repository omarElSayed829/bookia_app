import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/widgets/navBarWidget.dart';
import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/feature/intro/welcome_view.dart';
import 'package:flutter/material.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      String token = AppLocalStorage.getData(key: AppLocalStorage.token) ?? "";
      if (token.isEmpty) {
        pushReplacement(context, welcomeView());
      } else {
        pushReplacement(context, navBarWidget());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/logo.png")],
        ),
      ),
    );
  }
}
