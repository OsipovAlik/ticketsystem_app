class TicketPastUpcomingModel {
  final int id;
  final dynamic eventId;
 final dynamic partnerOrderId;
 final  EventInfo eventInfo;
  final String  orderDate;
  final int ticketCount;
  final int total;

  TicketPastUpcomingModel({
    required this.id, 
    required this.eventId, 
    required this.partnerOrderId,
    required this.eventInfo,
    required this.orderDate,
    required this.ticketCount,
    required this.total});

  // Factory method to create a TicketPastUpcomingModel object from JSON
  factory TicketPastUpcomingModel.fromJson(Map<String, dynamic> json) {
    return TicketPastUpcomingModel(
      id: json['id'] ,
      eventId: json['eventId'],
      partnerOrderId: json["partnerOrderId"] ?? 0,
      eventInfo: EventInfo.fromJson(json["eventInfo"]?? {}),
      orderDate: json["orderDate"] ?? "",
      ticketCount: json["ticketCount"] ?? 0,
      total: json["total"] ?? 0
    );
  }
static List<TicketPastUpcomingModel> fromJsonList(List<dynamic> jsonList) {      
    return jsonList.map((json) => TicketPastUpcomingModel.fromJson(json)).toList();
  }
}

class EventInfo {
  final int id;
  final String eventId;
  final String name;
  final String expiryDate;
  final String description;
  final String address;
  final String thName;
  final String mainImageEvent;
  final String posterImageEvent;
  EventInfo({
    required this.id,
    required this.eventId,
   required this.name,
   required this.description,
   required this.expiryDate,
   required this.address,
   required this.thName,
   required this.mainImageEvent,
   required this.posterImageEvent


  });
  factory EventInfo.fromJson(Map<String, dynamic> json) {
    return EventInfo(
      id: json['id'] ?? 0,
      eventId: json['eventId'] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      expiryDate: json["expiryDate"] ?? "",
      address: json["address"] ?? "",
      thName: json["thName"] ?? "",
      mainImageEvent: json["mainImageEvent"] ?? "",
      posterImageEvent: json["posterImageEvent"] ?? ""
    );
  }
}