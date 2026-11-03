import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/services/api/favorite/favorite.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import '../home_provider/model/event_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<EventModel> _list = [];
  bool _isVisible = false;

  List<EventModel> get list => _list;
  bool get isVisible => _isVisible;

  Future<void> getFavorite() async {
    _isVisible = true;
    notifyListeners();

    //  Map<String, dynamic> body = {};
    // String reqBody = jsonEncode(body);
    try {
      final res = await Favorite.shared.getListFavorite();
      _list = EventModel.fromJsonList(res.resData["list"]);
      _isVisible = false;
      notifyListeners();
    } catch (err) {
      _isVisible = false;
      notifyListeners();
    }
  }

  Future<void> addFavorite(BuildContext context, EventModel data) async {
    data.isFavorite = !data.isFavorite;
    notifyListeners();
    //  context.read<HomeProvider>().updateProductFavorite(data.id);
    //  context.read<EventDetailsProvider>().updateProductFavorite(data.id);
    // context.read<EventDetailsProvider>().updateProductFavoriteItem(data.id);

        _list.removeWhere((item) => item.id == data.id);
        notifyListeners();
      
    
    Map<String, dynamic> body = {"event_id": data.id};
    String reqBody = jsonEncode(body);
    try {
      final res = await Favorite.shared.removeFavorite(reqBody);
      if (!res.success) {
        data.isFavorite = !data.isFavorite;
        notifyListeners();
        SnackbarUtil.showSnackbar(context, res.message,
            duration: Duration(milliseconds: 500));
      }
    } catch (err) {
      data.isFavorite = !data.isFavorite;
      notifyListeners();
      SnackbarUtil.showSnackbar(context, S.current.system_error,
          duration: Duration(milliseconds: 500));
    }
  }
  
}
