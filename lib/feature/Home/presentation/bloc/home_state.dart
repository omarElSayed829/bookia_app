class HomeStates {}

class HomeInitial extends HomeStates {}

class GetBestSellersLoadingState extends HomeStates {}

class GetBestSellersSuccessState extends HomeStates {}

class GetBestSellerErrorState extends HomeStates {
  final String error;

  GetBestSellerErrorState(this.error);
}

class GetSlidersSuccessState extends HomeStates {}

class GetSlidersLoadingState extends HomeStates {}

class GetSlidersErrorState extends HomeStates {}

class AddToWishListLoadingState extends HomeStates {}

class AddToWishListLoaodedState extends HomeStates {}

class AddToWishListErrorState extends HomeStates {
  final String wishListError;
  AddToWishListErrorState({required this.wishListError});
}
