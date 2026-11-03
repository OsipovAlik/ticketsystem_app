

import 'response_model.dart';

class GlobalResModel {
  late dynamic resData;
  late String message;
  late bool success;

  GlobalResModel({
    required this.resData,  
    required this.message,
    required this.success
    });

 factory GlobalResModel.fromJson(Map<String, dynamic> data) {
  final resModel = ResponseModel.fromJson(data);
  final resData = resModel.data;
  final message = resModel.message; 
  final success = resModel.success;
  return GlobalResModel(
    resData: resData, 
    message: message,
    success: success
  );
}
}