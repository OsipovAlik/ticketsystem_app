class EventModel {
  final int id;
  final String eventId;
  final String theaterId;
  final String spectacleId;
  final String category;
  final String name;
  final String description;
  final String mainImageEvent;
  final String posterImageEvent;
  final String posterImageEventBase;
  final String video;
  final String expiryDate;
  final String month;
  final String dayOfWeek;
  final String day;
  final String hour;
  final bool isWeekday;
  final String minDate;
  final String maxDate;
  final String address;
  final String thName;
  final String thNameKey;
  bool isFavorite;
  final bool isExpired;
  final int status;
  final int purchaseCount;

  EventModel({
    required this.id,
    required this.eventId,
    required this.theaterId,
    required this.spectacleId,
    required this.category,
    required this.name,
    required this.description,
    required this.mainImageEvent,
    required this.posterImageEvent,
    required this.posterImageEventBase,
    required this.video,
    required this.expiryDate,
    required this.month,
    required this.dayOfWeek,
    required this.day,
    required this.hour,
    required this.isWeekday,
    required this.minDate,
    required this.maxDate,
    required this.address,
    required this.thName,
    required this.thNameKey,
    required this.isFavorite,
    required this.isExpired,
    required this.status,
    required this.purchaseCount,
  });

  // Factory method to create an EventModel from JSON
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      eventId: json['eventId'] ?? "",
      theaterId: json['theaterId'] ?? "",
      spectacleId: json['spectacleId'] ?? "",
      category: json['category'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      mainImageEvent: json['mainImageEvent'] ?? "",
      posterImageEvent: json['posterImageEvent'] ?? "",
      posterImageEventBase: json['posterImageEventBase'] ?? "",
      video: json['video'] ?? "",
      expiryDate: json['expiryDate'] ?? "",
      month: json['month'] ?? "",
      dayOfWeek: json["dayOfWeek"] ?? "",
      day: json['day'] ?? "",
      hour: json['hour'] ?? "",
      isWeekday: json["isWeekday"] ?? false,
      minDate: json['minDate'] ?? "",
      maxDate: json['maxDate'] ?? "",
      address: json['address'] ?? "",
      thName: json['thName'] ?? "",
      thNameKey: json['thNameKey'] ?? "",
      isFavorite: json['isFavorite']?? false,
      isExpired: json['isExpired']?? false,
      status: json['status'] ?? 0,
      purchaseCount: json['purchaseCount'] ?? 0,
    );
  }

 static List<EventModel> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => EventModel.fromJson(json)).toList();
  }
}