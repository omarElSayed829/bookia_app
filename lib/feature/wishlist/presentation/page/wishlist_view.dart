import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:flutter/material.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Wishlist here",
            style: getBodyTextStyle(),
          )
        ],
      ),
    );
  }
}
