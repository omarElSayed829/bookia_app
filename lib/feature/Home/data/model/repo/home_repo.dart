import 'package:bookia_app/core/services/Dio/dio_providor.dart';
import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/feature/Home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/Home/data/model/response/get_sliders_response_model/get_sliders_response_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/repo/auth_endpoints.dart';

class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSellers() async {
    var response = await DioProvidor.get(endPoint: AppEndPoints.bestSeller);

    if (response.statusCode == 200) {
      var model = BestSellerResponseModel.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }

  static Future<GetSlidersResponseModel?> getSliders() async {
    var response = await DioProvidor.get(endPoint: AppEndPoints.silders);

    if (response.statusCode == 200) {
      var model = GetSlidersResponseModel.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }

  static Future<bool> addToWishList({required int productId}) async {
    var response = await DioProvidor.post(
        endPoint: AppEndPoints.addToWishList,
        data: {
          "product_id": productId
        },
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
