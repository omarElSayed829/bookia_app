import 'package:bookia_app/feature/Home/data/model/repo/home_repo.dart';
import 'package:bookia_app/feature/Home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/Home/data/model/response/get_sliders_response_model/get_sliders_response_model.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_events.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSeller);
    on<GetSlidersEvent>(getSliders);
    on<AddToWishListEvent>(addToWishList);
    add(GetBestSellerEvent());
    add(GetSlidersEvent());
  }

  late BestSellerResponseModel bestSellerResponseModel;
  late GetSlidersResponseModel getSlidersResponseModel;

  Future<void> getBestSeller(
      GetBestSellerEvent event, Emitter<HomeStates> emit) async {
    emit(GetBestSellersLoadingState());
    await HomeRepo.getBestSellers().then((value) {
      if (value != null) {
        bestSellerResponseModel = value;
        emit(GetBestSellersSuccessState());
      } else {
        emit(GetBestSellerErrorState("Get best seller Failed"));
      }
    });
  }

  Future<void> getSliders(
      GetSlidersEvent event, Emitter<HomeStates> emit) async {
    emit(GetSlidersLoadingState());
    await HomeRepo.getSliders().then((value) {
      if (value != null) {
        getSlidersResponseModel = value;
        emit(GetSlidersSuccessState());
      } else {
        emit(GetSlidersErrorState());
      }
    });
  }

  Future<void> addToWishList(
      AddToWishListEvent event, Emitter<HomeStates> emit) async {
    emit(AddToWishListLoadingState());
    await HomeRepo.addToWishList(productId: event.productId).then((value) {
      if (value) {
        emit(AddToWishListLoaodedState());
      } else {
        emit(AddToWishListErrorState(wishListError: "Add To WishList Failed"));
      }
    });
  }
}
