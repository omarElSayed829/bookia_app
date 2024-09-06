
import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/feature/intro/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: "DMSerifDisplay",
        inputDecorationTheme: InputDecorationTheme(
          fillColor: appColors.borderColor,
          filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: appColors.accentColor)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:BorderSide(color: appColors.primaryColor)
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red),
            )
        ),

        
      ),
      
      debugShowCheckedModeBanner: false,
      home: const splashView()
        
          
        
      
    );
  }
}
