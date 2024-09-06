import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/pages/signUp_view.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_cards.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import'package:flutter_svg/flutter_svg.dart';
class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
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
              padding: EdgeInsets.only(left:10),
             
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text("Welcome Back! Glad to see you Again!",
            style: getHeadLineTextStyle(),),

            Gap(50),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Email"
              ),
            ),

          Gap(15),

        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter your password",
            suffixIcon: 
            
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset("assets/icons/eye.svg",width: 40,height:30,),
            ),

            suffixIconConstraints: BoxConstraints(
              maxHeight: 50,
              maxWidth: 50,
            )
          ),
        ),

      

      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: (){}, 
          child:Text("Forgot password ?",style: getSmallTextStyle(),))
        ],
      ),


        Gap(25),

        customButtonWidget(text: "Login",
         onPressed: (){
        pushReplacement(context,signUpView());
         },
          color: appColors.primaryColor),
        Gap(30),
          Row(
            children: [
              

          Expanded(child: 
          Divider()),
          Gap(15),
          Text("Or login with",style: getSmallTextStyle(),),
          Gap(15),
          Expanded(child: 
          Divider())
            ],
          ),
          Gap(30),

          Row(
            children: [
              Expanded(child:
              socialCards(image: SvgPicture.asset("assets/icons/facebook.svg"),)),
              Gap(5),

              Expanded(child: 
              socialCards(image: SvgPicture.asset("assets/icons/google.svg"),)),
              Gap(5),

              Expanded(child: 
              socialCards(image: SvgPicture.asset("assets/icons/apple.svg"),))
            ],
          ),

          Spacer(flex: 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(onPressed: (){}, child: Text("Register Now",
              style: getSmallTextStyle(color:appColors.primaryColor ),))
            ],
          )
          
          

          ],
        ),
      ),
      
    );
  }
}

