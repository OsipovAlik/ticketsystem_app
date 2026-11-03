import 'package:ticketsystem/services/api/auth/model/auth_user.dart';
import 'package:ticketsystem/services/models/response_models/global_res_model.dart';
import '../../models/http_service.dart';

class Auth extends HttpService {
  static Auth shared = Auth();
  final String login = '/login';
  final String register = '/register';

  ///$$$ BASKET DATA GET API
  Future loginUser(Object body) async {
    final response = await HttpService.shared.post(login,body);
    final res = AuthUser.fromJson(response);
    return res;
  }
    ///$$$ BASKET DATA GET API
  Future registerUser(Object body) async {
    final response = await HttpService.shared.post(register,body);
    final res = AuthUser.fromJson(response);
    return res;
  }

      ///$$$ BASKET DATA GET API
  Future removeAccount() async {
    final response = await HttpService.shared.get("/delete/account");
    final res = GlobalResModel.fromJson(response);
    return res;
  }
}
