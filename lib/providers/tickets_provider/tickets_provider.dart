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

  Future<void> onRefresh(BuildContext context) async {
    _isVisible = true;
    notifyListeners();
    await Future.wait([
      getPastTickets(context),
      getUpcomingTickets(context),
    ]);
    _isVisible = false;
    notifyListeners();
  }

  Future<void> getAllData(BuildContext context) async {
    if (_pastList.isEmpty && _upcomingList.isEmpty) {
      await onRefresh(context);
    }
  }

  Future<void> getPastTickets(BuildContext context) async {
    try {
      final res = await Order.shared.getPastOrder();
        _pastList = TicketPastUpcomingModel.fromJsonList(res.resData["list"]);
        // SnackbarUtil.showSnackbar(context, S.current.system_error,
        //     duration: Duration(milliseconds: 500));
    } catch (err) {
      // keep previous list on error
    }
  }


Future<void> getUpcomingTickets(BuildContext context) async {
    try {
      final res = await Order.shared.getUpcomingOrder();
       _upcomingList = TicketPastUpcomingModel.fromJsonList(res.resData["list"]);
        // SnackbarUtil.showSnackbar(context, S.current.system_error,
        //     duration: Duration(milliseconds: 500));
    } catch (err) {
      // keep previous list on error
    }
  }

}
