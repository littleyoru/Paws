class LoginResponse {
  String? error;
  Data? data;

  LoginResponse({this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        data = json['data'] != null ? new Data.fromJson(json['data']) : null;
}

class Data {
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
