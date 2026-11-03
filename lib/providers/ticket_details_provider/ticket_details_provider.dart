

import 'package:flutter/cupertino.dart';
import 'package:ticketsystem/services/api/order/order.dart';

import 'model/ticket_details_model.dart';

class TicketDetailsProvider extends ChangeNotifier{
  bool _isVisible = false;
 List<TicketDetailsModel> _list = [];

  bool get isVisible => _isVisible;
 List<TicketDetailsModel> get list => _list;

 Future<void> onRefresh(BuildContext context) async {
  await getTicketDetailsInfo(context);
  await getDetailsTickets(context);
 }
  
    Future<void> getTicketDetailsInfo(BuildContext context) async {
    _isVisible = true;
    notifyListeners();
    try {
      final res = await Order.shared.getTicketDetailsInfo();
      
        _list = TicketDetailsModel.fromJsonList(res.resData["list"]);
       _isVisible = false;
       notifyListeners();
    } catch (err) {
       _isVisible = false;
       notifyListeners();
        // SnackbarUtil.showSnackbar(context, S.current.system_error,
        //     duration: Duration(milliseconds: 500));
    }
  }

    Future<void> getDetailsTickets(BuildContext context) async {
   _isVisible = true;
    notifyListeners();
    try {
      final res = await Order.shared.getTicketDetails();
      _list = TicketDetailsModel.fromJsonList(res.resData["list"]);
       _isVisible = false;
      notifyListeners();
    } catch (err) {
      debugPrint("$err");
       _isVisible = false;
       notifyListeners();
        // SnackbarUtil.showSnackbar(context, S.current.system_error,
        //     duration: Duration(milliseconds: 500));
    }
  }
}