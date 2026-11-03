class EventDetailsModel {
  final int id;
  final String eventId;
  final String theaterId;
  final String spectacleId;
  final String category;
  final String categoryName;
  final String name;
  final String place;
  final String description;
  final String mainImageEvent;
  final String posterImageEvent;
  final double lat;
  final double lng;
  final String address;
  // final double? minPrice;
  final List<PerformersModel> performers;
  // final String? video;
  // final DateTime expiryDate;
  final String? minDate;
  final String maxDate;
  final String thName;
  final String thNameKey;
  final List<TimeLine> timeLine;
  bool isFavorite;
  final bool isExpired;
  final String url;
  final String eventDay;
  final String eventDayOfWeek;
  final String eventMonth;
  final String eventHour;
  final bool isWeekday;

  EventDetailsModel({
    required this.id,
    required this.eventId,
    required this.theaterId,
    required this.spectacleId,
    required this.category,
    required this.name,
    required this.place,
    required this.categoryName,
    required this.description,
    required this.mainImageEvent,
    required this.posterImageEvent,
    required this.lat,
    required this.lng,
    required this.address,
    // this.minPrice,
    required this.performers,
    // this.video,
    // required this.expiryDate,
    this.minDate,
    required this.maxDate,
    required this.thName,
    required this.thNameKey,
    required this.timeLine,
    required this.isFavorite,
    required this.isExpired,
    required this.url,
    required this.eventDay,
    required this.eventDayOfWeek,
    required this.eventMonth,
    required this.eventHour,
    required this.isWeekday,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsModel(
      id: json['id'],
      eventId: json['eventId'] ?? "",
      theaterId: json['theaterId'] ?? "",
      spectacleId: json['spectacleId'] ?? "",
      category: json['category'] ?? "",
      name: json['name'] ?? "",
      place: json['place'] ?? "",
      categoryName: json['categoryName'] ?? "",
      description: json['description'] ?? "",
      mainImageEvent: json['mainImageEvent'] ?? "",
      posterImageEvent: json['posterImageEvent'] ?? "",
      lat: json['lat'],
      lng: json['lng'],
      address: json['address'] ?? "",
      // minPrice: json['minPrice'] != null ? (json['minPrice'] as num).toDouble() : null,
      performers: (json['performers'] as List<dynamic>).map((e) => PerformersModel.fromJson(e)).toList(),
      // video: json['video'] ?? "",
      // expiryDate: DateTime.parse(json['expiryDate'] ?? ""),
      eventDay: json["day"] ?? "",
      eventDayOfWeek: json["dayOfWeek"] ?? "",
      eventMonth: json["month"] ?? "",
      eventHour: json["hour"] ?? "",
      minDate: json['minDate'] ?? "",
      maxDate: json['maxDate'] ?? "",
      thName: json['thName'] ?? "",
      thNameKey: json['thNameKey'] ?? "",
      timeLine: (json['timeLine'] as List<dynamic>).map((e) => TimeLine.fromJson(e)).toList(),
      isFavorite: json['isFavorite'] ?? false,
      isExpired: json['isExpired'] ?? false,
      url: json["url"] ?? "https://www.ticketsystem.am/hy",
      isWeekday: json["isWeekday"] ?? false,
    );
  }
  

}

class PerformersModel {
  final String name;
  final String image;
  PerformersModel({
    required this.name,
    required this.image
  });
  factory PerformersModel.fromJson(Map<String, dynamic> json){
    return PerformersModel(
      name: json["name"] ?? "", 
      image: json["image"] ?? "",
    );
  }
}

class TimeLine {
  final int id;
  final DateTime expiryDate;
  final String month;
  final String day;
  final String hour;
  final String url;
  final String dayOfWeek;
  final bool isWeekday;
  final bool isSelected;

  TimeLine({
    required this.id,
    required this.expiryDate,
    required this.month,
    required this.day,
    required this.hour,
    required this.url,
    required this.dayOfWeek,
    required this.isWeekday,
    required this.isSelected,
  });

  factory TimeLine.fromJson(Map<String, dynamic> json) {
    return TimeLine(
      id: json['id'],
      expiryDate: DateTime.parse(json['expiryDate']?? ""),
      month: json['month'] ?? "",
      day: json['day'] ?? "",
      hour: json['hour'] ?? "",
      url: json['url'] ?? "https://www.ticketsystem.am",
      dayOfWeek: json['dayOfWeek'] ?? "",
      isWeekday: json['isWeekday'] ?? false,
      isSelected: json['isSelected'] ?? false,
    );
  }
}
