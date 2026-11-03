import 'package:flutter/material.dart';

class SearchProvider extends  ChangeNotifier {
  final List _list = [];
  bool _isVisible = false;

  List get list => _list;
  bool get isVisible => _isVisible;



  Future<void> getSearch() async {
    _isVisible = true;
    notifyListeners();

    //  Map<String, dynamic> body = {};
    // String reqBody = jsonEncode(body);
    try {
      // final res = await Favorite.shared.getListFavorite();
      // print(res.resData);

      _isVisible = false;
      notifyListeners();
    } catch (err) {
      _isVisible = false;
      notifyListeners();
    }
  }


}