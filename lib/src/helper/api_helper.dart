// Singleton class
import 'dart:convert';

import 'package:api_cubit/src/helper/storage_helper.dart';
import 'package:api_cubit/src/helper/storage_keys.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();
  factory ApiHelper() => _instance;

  ApiHelper._internal(); // Object of APiHelper

  static final Dio dio = Dio();

  initialize() {
    dio.options.baseUrl = 'http://15.206.27.26/';
    dio.options.connectTimeout = 30000; //5s
    dio.options.receiveTimeout = 30000;
  }

  Future<ApiResponseModel> makeGetRequest(String route,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
        await dio.get(route, options: Options(headers: mHeaders));
    return ApiResponseModel.fromJSON(response.data);
  }

  Future<ApiResponseModel> makePostRequest(String route, dynamic body,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.post(route,
        data: jsonEncode(body), options: Options(headers: mHeaders));
    return ApiResponseModel.fromJSON(response.data);
  }

  Future<ApiResponseModel> makePutRequest(String route, dynamic body,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.put(route,
        data: jsonEncode(body), options: Options(headers: mHeaders));
    return ApiResponseModel.fromJSON(response.data);
  }

  Future<ApiResponseModel> makePatchRequest(String route, dynamic body,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.patch(route,
        data: jsonEncode(body), options: Options(headers: mHeaders));
    return ApiResponseModel.fromJSON(response.data);
  }


  Future<ApiResponseModel> makeDeleteRequest(String route,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
    await dio.delete(route, options: Options(headers: mHeaders));
    return ApiResponseModel.fromJSON(response.data);
  }

  Future<Map<String, String>> getDefaultHeaders() async {
    String? token = await StorageHelper.readData(StorageKeys.jwt.name);
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    return headers;
  }
}
