import 'package:bookia_app/core/Utils/functions/navigation.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/core/Utils/widgets/custom_button.dart';
import 'package:bookia_app/feature/Home/data/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_state.dart';
import 'package:bookia_app/feature/Home/presentation/page/books_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:bookia_app/core/Utils/app_color.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            "Best Seller",
            style: getBodyTextStyle(color: appColors.black),
          ),
          const Gap(10),
          BlocBuilder<HomeBloc, HomeStates>(
            buildWhen: (previous, current) =>
                current is GetBestSellersLoadingState ||
                current is GetBestSellersSuccessState,
            builder: (context, state) {
              if (state is GetBestSellersSuccessState) {
                var books = context
                    .read<HomeBloc>()
                    .bestSellerResponseModel
                    .data
                    ?.products;

                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 300,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: books?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          push(
                              context,
                              BooksDetailsView(
                                products: books?[index],
                              ));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 235, 226, 226),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: books?[index].id ?? "",
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        books?[index].image ?? "",
                                        fit: BoxFit.cover,
                                        width: 200,
                                        errorBuilder: (context, error,
                                                stackTrace) =>
                                            Icon(Icons.error_outline_outlined),
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(3),
                                Text(
                                  books?[index].name ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      getBodyTextStyle(color: appColors.black),
                                ),
                                const Gap(5),
                                Row(
                                  children: [
                                    Text(
                                      books?[index].price ?? "",
                                      style: getBodyTextStyle(
                                          color: appColors.black),
                                    ),
                                    const Spacer(),
                                    customButtonWidget(
                                      text: "Buy",
                                      onPressed: () {},
                                      color: appColors.black,
                                      width: 80,
                                      height: 28,
                                    )
                                  ],
                                )
                              ],
                            )),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
