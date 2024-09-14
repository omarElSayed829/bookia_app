import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/feature/Home/presentation/widgets/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(
          children: [
            Image.asset("assets/images/logo.png",width:100,),
           const   Spacer(),
            SvgPicture.asset("assets/icons/notification.svg"),
           const Gap(20),
            SvgPicture.asset("assets/icons/search.svg")
            
          ],
        ) ,
      ),

        
      
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Gap(5),
        
         const  bannerHomeWidget(),
        
          
        
          Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                  
                    children: [
          Text("Popular Books",style: getBodyTextStyle(color: appColors.black),),
          
         const Gap(10),
          
            GridView.builder(
              shrinkWrap: false,
              physics:const NeverScrollableScrollPhysics(),
              gridDelegate:
         const   SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisExtent: 300,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
              ), 
               itemCount: 10,
            itemBuilder:(context , index){
              return Column(
              
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: appColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/book.png",
                          fit: BoxFit.cover,width:200,),
                        ),
                     const   Gap(3),
                        Text("the book",
                        style: getBodyTextStyle(color: appColors.black),),
                       const Gap(5),
                        Row(
                          children: [
                            Text("₹285",style: getBodyTextStyle(color: appColors.black),),
                      
                         const   Spacer(),
                      
                            customButtonWidget(text:"Buy", 
                            onPressed: (){}, 
                            color: appColors.black,
                            width: 80,
                            height: 28,)
                          ],
                        )
                      ],
                    )
                  ),
                 
                ],
              );
            } ),
                    ],
                  ),
          )
          
         
          ],
        ),
      ),
    );
  }
}

