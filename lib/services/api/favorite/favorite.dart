
import '../../models/http_service.dart';
import '../../models/response_models/global_res_model.dart';



class Favorite extends HttpService {
  static Favorite shared = Favorite();
  String controler = '/event';


  Future getListFavorite() async {
    final response = await HttpService.shared.post("$controler/favorite/list");
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future addFavorite(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/add/favorite",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }
  Future removeFavorite(Object reqBody) async {
    final response = await HttpService.shared.post("$controler/remove/favorite",reqBody);
    final res = GlobalResModel.fromJson(response);
    return res;
  }
}
