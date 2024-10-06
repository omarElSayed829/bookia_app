import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/Home/presentation/page/home_view.dart';
import 'package:bookia_app/feature/cart/presentation/pages/cart_view.dart';
import 'package:bookia_app/feature/profile/presentation/pages/profile_view.dart';
import 'package:bookia_app/feature/wishlist/presentation/page/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class navBarWidget extends StatefulWidget {
  const navBarWidget({super.key});

  @override
  State<navBarWidget> createState() => _navBarWidgetState();
}

class _navBarWidgetState extends State<navBarWidget> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const homeView(),
    const WishListView(),
    const CartView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Home.svg"),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
                  label: "wishlist"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/cart.svg"),
                  label: "cart"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Profile.svg"),
                  label: "profile"),
            ]),
      ),
    );
  }
}
