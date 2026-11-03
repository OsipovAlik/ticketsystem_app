

class ResponseModel {
  late bool success;
  late dynamic data;
  late String message;

  ResponseModel({required this.success, required this.data, required this.message});
  factory ResponseModel.fromJson(Map<String, dynamic> data) {
    final success = data['success'] as bool;
    final content = data['data'] ?? [] as dynamic;
    final message = data['message'] ?? "";
    return ResponseModel(success: success, data: content, message: message);
  }
}

