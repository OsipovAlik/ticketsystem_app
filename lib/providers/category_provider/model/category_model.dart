class CategoryModel {
  final String id;
  final String name;
  final String icon;
  bool isActive;

  CategoryModel({required this.id, required this.name, required this.icon, this.isActive = false});

  // Factory method to create a CategoryModel object from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? "",
      name: json['name']?? "",
      icon: json["icon"] ?? "",
      isActive: json["isActive"] ?? false
    );
  }
static List<CategoryModel> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
