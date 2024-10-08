import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:bookia_app/feature/Home/data/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:bookia_app/core/Utils/app_color.dart';

class bannerHomeWidget extends StatefulWidget {
  const bannerHomeWidget({
    super.key,
  });

  @override
  State<bannerHomeWidget> createState() => _bannerHomeWidgetState();
}

class _bannerHomeWidgetState extends State<bannerHomeWidget> {
  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeBloc, HomeStates>(
          buildWhen: (previous, current) =>
              current is GetSlidersLoadingState ||
              current is GetSlidersSuccessState,
          builder: (context, state) {
            if (state is GetSlidersSuccessState) {
              var sliders = context
                  .read<HomeBloc>()
                  .getSlidersResponseModel
                  .data
                  ?.sliders;
              return CarouselSlider.builder(
                  itemCount: sliders?.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Image.network(
                                sliders?[itemIndex].image ?? "",
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                              Positioned(
                                  top: 10,
                                  left: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          " Find out the best books to read\n when you dont even know what\n to read !!!",
                                          style: getSmallTextStyle(
                                              color: appColors.whiteColor),
                                        ),
                                        Gap(8),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: appColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                "Explore",
                                                style: TextStyle(
                                                    color:
                                                        appColors.primaryColor),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          )),
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (itemIndex, reason) {
                      setState(() {
                        bannerIndex = itemIndex;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ));
            } else {
              return SizedBox();
            }
          },
        ),
        Gap(10),
        SmoothPageIndicator(
            controller:
                PageController(initialPage: bannerIndex), // PageController
            count: 4,
            effect: ExpandingDotsEffect(
                activeDotColor: appColors.primaryColor,
                dotColor: appColors.borderColor,
                expansionFactor: 5),
            // your preferred effect
            onDotClicked: (index) {})
      ],
    );
  }
}
