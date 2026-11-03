

import 'package:ticketsystem/global/global.dart';

import '../../models/http_service.dart';
import '../../models/response_models/global_res_model.dart';



class Event extends HttpService {
  static Event shared = Event();
  String controler = '/event';


  Future getCategory(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/category/list",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future getBanner(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/top/list",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future getEventList(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/list",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }

  Future getdate(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/calendar",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }

  Future getEventDetails(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/details/$eventId",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future getEventSimiler() async {
    final response = await HttpService.shared.post("$controler/similar/$eventId");
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future getEventItemsFilters(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/filter-list",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }

}
