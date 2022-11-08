import 'package:api_cubit/src/helper/api_helper.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:api_cubit/src/models/category_model.dart';
import 'package:api_cubit/src/web_service/api_routes.dart';

class CategoryRepository {
  Future<ApiResponseModel> addCategory(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makePostRequest(ApiRoutes.categoryRoute, categoryModel.toJSON());
    return response;
  }

  Future<ApiResponseModel> getAllCategory() async {
    ApiResponseModel response = await ApiHelper()
        .makeGetRequest(ApiRoutes.categoryRoute);
    return response;
  }

  Future<ApiResponseModel> getCategoryById(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makeGetRequest(ApiRoutes.categoryRoute+"/${categoryModel.id}",);
    return response;
  }

  Future<ApiResponseModel> updateCategory(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makePatchRequest(ApiRoutes.categoryRoute+"/${categoryModel.id}", categoryModel.toJSON());
    return response;
  }

  Future<ApiResponseModel> deleteCategory(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makeDeleteRequest(ApiRoutes.categoryRoute+"/${categoryModel.id}",);
    return response;
  }


}
