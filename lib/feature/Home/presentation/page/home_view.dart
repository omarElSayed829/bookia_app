import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_events.dart';
import 'package:bookia_app/feature/Home/presentation/widgets/banner_widget.dart';
import 'package:bookia_app/feature/Home/presentation/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 100,
            ),
            const Spacer(),
            SvgPicture.asset("assets/icons/notification.svg"),
            const Gap(20),
            SvgPicture.asset("assets/icons/search.svg")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(5),
            const bannerHomeWidget(),
            BestSellerWidget()
          ],
        ),
      ),
    );
  }
}
