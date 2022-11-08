import 'package:api_cubit/src/helper/api_helper.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:api_cubit/src/web_service/api_routes.dart';

class AuthenticationRepository {

  Future<ApiResponseModel> login(String email, String password) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    ApiResponseModel response =
        await ApiHelper().makePostRequest(ApiRoutes.loginRoute, data);
    return response;
  }

  Future<ApiResponseModel> changePassword(
      String currentPassword, String newPassword) async {
    Map<String, dynamic> data = {
      "currentPassword": currentPassword,
      "newPassword": newPassword
    };
    ApiResponseModel response =
        await ApiHelper().makePostRequest(ApiRoutes.changePasswordRoute, data);
    return response;
  }
  Future<ApiResponseModel> updateUser(
      Map<String,dynamic> data) async {
    ApiResponseModel response =
    await ApiHelper().makePatchRequest(ApiRoutes.changePasswordRoute, data);
    return response;
  }


}
