

class EventCategoryFilter {
  final String key;
  final String name;
  final List<Item> items;

  EventCategoryFilter({
    required this.key,
    required this.name,
    required this.items,
  });

  factory EventCategoryFilter.fromJson(Map<String, dynamic> json) {
    return EventCategoryFilter(
      key: json['key'] ?? "",
      name: json['name'] ?? "",
      items: (json['items'] as List<dynamic>).map((e) => Item.fromJson(e)).toList(),
    );
  }

  static List<EventCategoryFilter> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => EventCategoryFilter.fromJson(json)).toList();
  }
}
class Item {
  final dynamic key;
  final String value;
  bool isChecked;

  Item({
    required this.key,
    required this.value,
    this.isChecked = false
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      key: json['key'] ?? "" ,
      value: json['value'] ?? "",
      isChecked: json["isChecked"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
      "isChecked": isChecked
    };
  }
}