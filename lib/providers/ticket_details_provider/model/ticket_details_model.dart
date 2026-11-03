class TicketDetailsModel {
  final int id;
  final int orderId;
  final int row;
  final String seat;
  final String section;
  final String ticketSeatInfo;
  final EventInfo eventInfo;
  final int price;
  final String qrImage;
  final String qrCode;

  TicketDetailsModel({
    required this.id,
    required this.orderId,
    required this.row,
    required this.seat,
    required this.section,
    required this.ticketSeatInfo,
    required this.eventInfo,
    required this.price,
    required this.qrImage,
    required this.qrCode,
  });

  factory TicketDetailsModel.fromJson(Map<String, dynamic> json) {
    return TicketDetailsModel(
      id: json['id'],
      orderId: json['orderId'],
      row: json['row'],
      seat: json['seat'],
      section: json['section'],
      ticketSeatInfo: json['ticketSeatInfo'],
      eventInfo: EventInfo.fromJson(json['eventInfo']),
      price: json['price'],
      qrImage: json['qrImage'],
      qrCode: json['qrCode'],
    );
  }

static List<TicketDetailsModel> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => TicketDetailsModel.fromJson(json)).toList();
  }
  
}

class EventInfo {
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
  final String day;
  final String hour;
  final String dayOfWeek;
  final bool isWeekday;
  final String address;
  final String thName;
  final String thNameKey;
  final bool isFavorite;
  final bool isExpired;
  final int status;
  final int purchaseCount;

  EventInfo({
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
    required this.day,
    required this.hour,
    required this.dayOfWeek,
    required this.isWeekday,
    required this.address,
    required this.thName,
    required this.thNameKey,
    required this.isFavorite,
    required this.isExpired,
    required this.status,
    required this.purchaseCount,
  });

  factory EventInfo.fromJson(Map<String, dynamic> json) {
    return EventInfo(
      id: json['id'],
      eventId: json['eventId'],
      theaterId: json['theaterId'],
      spectacleId: json['spectacleId'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      mainImageEvent: json['mainImageEvent'],
      posterImageEvent: json['posterImageEvent'],
      posterImageEventBase: json['posterImageEventBase'],
      video: json['video'],
      expiryDate: json['expiryDate'],
      month: json['month'],
      day: json['day'],
      hour: json['hour'],
      dayOfWeek: json['dayOfWeek'],
      isWeekday: json['isWeekday'],
      address: json['address'],
      thName: json['thName'],
      thNameKey: json['thNameKey'],
      isFavorite: json['isFavorite'],
      isExpired: json['isExpired'],
      status: json['status'],
      purchaseCount: json['purchaseCount'],
    );
  }
}
