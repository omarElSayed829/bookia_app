import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/feature/Home/data/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_events.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:bookia_app/core/Utils/app_color.dart';

class BooksDetailsView extends StatelessWidget {
  const BooksDetailsView({super.key, required this.products});

  final Product? products;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeStates>(
      listener: (context, state) {
        if (state is AddToWishListLoaodedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("wishList added successfully")));
        } else if (state is AddToWishListErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: appColors.primaryColor,
              content: Text(state.wishListError)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset("assets/icons/backIcon.svg")),
              IconButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(AddToWishListEvent(productId: products?.id ?? 0));
                  },
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg"))
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Text(
                '\$${products?.price ?? ""}',
                style: getHeadLineTextStyle(),
              ),
              Spacer(),
              customButtonWidget(
                text: "Add to cart",
                onPressed: () {},
                color: appColors.black,
                width: 250,
                radius: 5,
              )
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Column(
              children: [
                Hero(
                  tag: products?.id ?? "",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      products?.image ?? "",
                      fit: BoxFit.cover,
                      width: 200,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error_outline_outlined),
                    ),
                  ),
                ),
                Gap(15),
                Text(
                  products?.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getHeadLineTextStyle(color: appColors.black),
                ),
                Gap(10),
                Text(
                  products?.category ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getHeadLineTextStyle(color: appColors.primaryColor),
                ),
                Gap(10),
                Text(
                  products?.description ?? "",
                  style: getBodyTextStyle(color: appColors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
