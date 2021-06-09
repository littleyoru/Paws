class RegisterResponse {
  String? error;
  String? data;

  RegisterResponse({this.error, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        data = json['data'];
}
