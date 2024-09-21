import 'package:bookia_app/feature/Home/presentation/page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class navBarWidget extends StatelessWidget {
  const navBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      homeView(),
    ];
    return Scaffold(
      body: homeView(),
      bottomNavigationBar:
          BottomNavigationBar(showSelectedLabels: false, items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Home.svg"), label: "home"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
            label: "wishlist"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg"), label: "cart"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Profile.svg"),
            label: "profile"),
      ]),
    );
  }
}
