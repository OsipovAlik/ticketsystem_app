class DateModel {
  final String month;
  final String day;
  final bool isWeekend;
  final String weekday;
  final String startDate;
  final String endDate;
  bool isActive;

  DateModel({
    required this.month,
    required this.day,
    required this.isWeekend,
    required this.weekday,
    required this.startDate,
    required this.endDate,
    this.isActive = false
  });

  // Factory constructor to create a DateModel instance from a JSON object
  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      month: json['month'].substring(0,3).toUpperCase()?? "",
      day: json['day'] ?? "",
      isWeekend: json['isWeekend'] ?? false,
      weekday: json['weekday'].substring(0,3).toUpperCase() ?? "",
      startDate: json['startDate'] ?? "",
      endDate: json['endDate'] ?? "",
      isActive: json['isActive'] ?? false
    );
  }


static List<DateModel> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => DateModel.fromJson(json)).toList();
  }
  
  }