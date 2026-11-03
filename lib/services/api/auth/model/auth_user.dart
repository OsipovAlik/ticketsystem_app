import 'package:ticketsystem/services/models/response_models/response_model.dart';

class AuthUser {
  late dynamic resData;
  late String message;
  late String token;
  late dynamic user;
  late String name;
  late String email;
  late String phone;
  late bool success;

  AuthUser({
    required this.resData, 
    required this.token, 
    required this.user,
    required this.name, 
    required this.email, 
    required this.phone,
    required this.message,
    required this.success
    });

 factory AuthUser.fromJson(Map<String, dynamic> data) {
  final resModel = ResponseModel.fromJson(data);
  final resData = resModel.data;
  final token = resData["token"] ?? "";
  final user = resData["user"] ?? {};
  final name = user["name"] ?? "";
  final email = user["email"] ?? "";
  final phone = user["phone"] ?? "";
  final message = resModel.message; 
  final success = resModel.success;
  return AuthUser(
    resData: resData, 
    token:token,
    user: user,
    name: name,
    email: email,
    phone: phone,
    message: message,
    success: success
  );
}
}