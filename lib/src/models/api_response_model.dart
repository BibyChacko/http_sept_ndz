class ApiResponseModel {
  final bool status;
  final dynamic data;
  final String? msg;
  final String? error;
  final String? token;
  final bool? isForceLogin;

  const ApiResponseModel(
      {required this.status,
      this.data,
      this.msg,
      this.error,
      this.token,
      this.isForceLogin});

  factory ApiResponseModel.fromJSON(Map<String, dynamic> json) {
    return ApiResponseModel(
        status: json["status"],
        data: json["data"],
        msg: json["msg"],
        error: json["error"],
        token: json["token"],
        isForceLogin: json["isForceLogin"]);
  }
}
