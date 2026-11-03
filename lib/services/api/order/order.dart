
import '../../../global/global.dart';
import '../../models/http_service.dart';
import '../../models/response_models/global_res_model.dart';


class Order extends HttpService {
  static Order shared = Order();
  String controler = '/order';


  Future getPastOrder() async {
    final response = await HttpService.shared.post("$controler/past-events");
    final res = GlobalResModel.fromJson(response);
    return res;
  }

  Future getUpcomingOrder() async {
    final response = await HttpService.shared.post("$controler/upcoming-events");
    final res = GlobalResModel.fromJson(response);
    return res;
  }

  Future getTicketDetails() async {
    final response = await HttpService.shared.post("$controler/tickets/$ticketId");
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future getTicketDetailsInfo() async {
    final response = await HttpService.shared.post("$controler/info/$ticketId");
    final res = GlobalResModel.fromJson(response);
    return res;
  }
}
