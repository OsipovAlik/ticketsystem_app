import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/tickets_provider/model/ticket_past_upcoming_model.dart';
// import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/services/api/order/order.dart';
// import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';

class TicketsProvider extends ChangeNotifier {
  bool _isVisible = false;
  List<TicketPastUpcomingModel> _pastList = [];
 List<TicketPastUpcomingModel> _upcomingList = [];
    
  bool get isVisible => _isVisible;
  List<TicketPastUpcomingModel> get pastList => _pastList;
  List<TicketPastUpcomingModel> get upcomingList => _upcomingList;

  void onRefresh(BuildContext context){
    getPastTickets(context);
    getUpcomingTickets(context);
  }

 void getAllData(BuildContext context){
      if(_pastList.isEmpty && _upcomingList.isEmpty){
       getPastTickets(context);
       getUpcomingTickets(context);
      }
    
  }

  Future<void> getPastTickets(BuildContext context) async {
    _isVisible = true;
    notifyListeners();
    try {
      final res = await Order.shared.getPastOrder();
        _pastList = TicketPastUpcomingModel.fromJsonList(res.resData["list"]);
       _isVisible = false;
       notifyListeners();
    } catch (err) {
       _isVisible = false;
       notifyListeners();
        // SnackbarUtil.showSnackbar(context, S.current.system_error,
        //     duration: Duration(milliseconds: 500));
    }
  }

  
Future<void> getUpcomingTickets(BuildContext context) async {
    _isVisible = true;
    notifyListeners();
    try {
      final res = await Order.shared.getUpcomingOrder();
       _upcomingList = TicketPastUpcomingModel.fromJsonList(res.resData["list"]);
       _isVisible = false;
       notifyListeners();
    } catch (err) {
        _isVisible = false;
       notifyListeners();
        // SnackbarUtil.showSnackbar(context, S.current.system_error,
        //     duration: Duration(milliseconds: 500));
    }
  }

}
