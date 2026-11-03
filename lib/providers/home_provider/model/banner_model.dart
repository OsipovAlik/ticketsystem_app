class BannerModel {
  final int id;
  final String mainImageEvent;
  final String name;

  BannerModel({required this.id, required this.mainImageEvent, required this.name});

  // Factory method to create a BannerModel object from JSON
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      mainImageEvent: json['mainImageEvent']?? "",
      name: json["name"] ?? ""
    );
  }
static List<BannerModel> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => BannerModel.fromJson(json)).toList();
  }
}
