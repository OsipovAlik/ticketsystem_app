import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/providers/home_provider/model/date_model.dart';
import 'package:ticketsystem/providers/home_provider/model/event_model.dart';
import 'package:ticketsystem/screens/auth/login/login.dart';
import 'package:ticketsystem/services/api/favorite/favorite.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import '../../services/api/event/event.dart';
import 'model/banner_model.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoadingEvent = false;
  bool _isLoadingBanner = false;
  bool _isLoadingDate = false;
  bool _isLoadingCategory = false;
  String _serarch = "";
  List<BannerModel> _bannerList = [];
  List<DateModel> _dateList = [];
  List<EventModel> _eventList = [];
  List<CategoryModel> _categoryList = [];
  String _startDate = "";
  final String _endDate = "";
  int page = 1;
  int itemCount = 30;
  bool _isLoadingPagination = false;
  Timer? _searchDebounce;

  String get search => _serarch;
  bool get isLoadingBanner => _isLoadingBanner;
  bool get isLoadingEvent => _isLoadingEvent;
  bool get isLoadingCategory => _isLoadingCategory;
  List<BannerModel> get bannerList => _bannerList;
  List<DateModel> get dateList => _dateList;
  List<EventModel> get eventList => _eventList;
  List<CategoryModel> get categoryList => _categoryList;
  bool get isLoadingDate => _isLoadingDate;
  String get startDate => _startDate;
  String get endDate => _endDate;
  bool get isLoadingPagination => _isLoadingPagination;



  void getAllData() {
    page = 1;
    itemCount = 1;
    _isLoadingEvent = true;
    getCategory();
    getBanner();
    getEventList();
    getDate();
  }

  void searchList(String value) {
    _serarch = value;
    notifyListeners();
    page = 1;
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      getEventList();
    });
  }

  void removeSearch() {
    _serarch = "";
    notifyListeners();
    page = 1;
    _searchDebounce?.cancel();
    getEventList();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  Future<void> getBanner() async {
    _isLoadingBanner = true;
    Map<String, dynamic> body = {
      "page": "1",
      "count": "10",
    };

    String reqBody = jsonEncode(body);
    try {
        final res = await Event.shared.getBanner(reqBody);
        _bannerList = BannerModel.fromJsonList(res.resData["list"]);
        _isLoadingBanner = false;
        notifyListeners();
    } catch (err) {
      _isLoadingBanner = false;
      notifyListeners();
    }
  }

  Future<void> getEventList() async {
    Map<String, dynamic> body = {
      "page": page,
      "count": 30,
      "categories": categoryListId,
      "startDate": _startDate,
      "endDate": _endDate,
      "name": _serarch
    };

    String reqBody = jsonEncode(body);
    try {
      final res = await Event.shared.getEventList(reqBody);
      if (page == 1) {
        _eventList = EventModel.fromJsonList(res.resData["list"]);
        itemCount = res.resData["pageCount"];
        _isLoadingEvent = false;

        notifyListeners();
      } else {
        _eventList.addAll(EventModel.fromJsonList(res.resData["list"]));
        _isLoadingEvent = false;
        _isLoadingPagination = false;
        notifyListeners();
      }
    } catch (err) {
      _isLoadingEvent = false;
      _isLoadingPagination = false;
      notifyListeners();
    }
  }

  void getAllEvent(BuildContext context, CategoryModel data) {
    categoryListId.clear();
    for(var i = 0; i< _categoryList.length;i++){
        if(_categoryList[i].id == data.id){
           _categoryList[i].isActive  = !_categoryList[i].isActive ;
           if(_categoryList[i].isActive){
             categoryListId.add(data.id);
           }else{
             categoryListId.clear();
           }
          
        }else{
           _categoryList[i].isActive  = false;
        }
      }
       page = 1;
       _isLoadingEvent = true;
      notifyListeners();
      getEventList();
  }

  Future<void> getCategory() async {
    _isLoadingCategory = true;
    Map<String, dynamic> body = {
      "page": 1,
      "count": 10,
      "startDate": "",
      "endDate": ""
    };

    String reqBody = jsonEncode(body);

    try {
        final res = await Event.shared.getCategory(reqBody);
        _categoryList = CategoryModel.fromJsonList(res.resData["list"]);
          _isLoadingCategory = false;
        notifyListeners();
    } catch (err) {
      _isLoadingCategory = false;
      notifyListeners();
    }
  }

  Future<void> getDate() async {
    _isLoadingDate = true;
    // notifyListeners();
    Map<String, dynamic> body = {
      "page": 1,
      "count": 10,
      "dateFrom": "2024-06-04T08:03:43.970Z",
      "categories": []
    };

    String reqBody = jsonEncode(body);
    try {
        final res = await Event.shared.getdate(reqBody);
        _dateList = DateModel.fromJsonList(res.resData["list"]);
        _isLoadingDate = false;
        notifyListeners();
    } catch (err) {
      _isLoadingDate = false;
      notifyListeners();
    }
  }

  Future<void> onTapDate(int idx, String startDate) async {

    for (var i = 0; i < _dateList.length; i++) {
      if (i == idx) {
        _startDate = startDate;
        if(_dateList[i].isActive){
         _startDate = "";
        }
        _dateList[i].isActive = !_dateList[i].isActive;
      } else {
        _dateList[i].isActive = false;
      }
    }
    page = 1;
    _isLoadingEvent = true;
    notifyListeners();
    await getEventList();
  }

  final Set<dynamic> _favoriteInFlight = {};

  Future<void> addFavorite(BuildContext context, EventModel data) async {
    if (!guest) {
      if (_favoriteInFlight.contains(data.id)) return;
      _favoriteInFlight.add(data.id);
      data.isFavorite = !data.isFavorite;
      notifyListeners();

      Map<String, dynamic> body = {"event_id": data.id};
      String reqBody = jsonEncode(body);
      try {
        final res = await Favorite.shared.addFavorite(reqBody);
        if (!res.success) {
          data.isFavorite = !data.isFavorite;
          notifyListeners();
          if (!context.mounted) return;
          SnackbarUtil.showSnackbar(context, res.message,
              duration: Duration(milliseconds: 500));
        }
      } catch (err) {
        data.isFavorite = !data.isFavorite;
        notifyListeners();
        if (!context.mounted) return;
        SnackbarUtil.showSnackbar(context, S.current.system_error,
            duration: Duration(milliseconds: 500));
      } finally {
        _favoriteInFlight.remove(data.id);
      }
    } else {
      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  ///$$$ UPDATE lIST FAVORITE ITEM NO CALL API $$$///
  void updateProductFavorite(int id) {
    for (var i = 0; i < _eventList.length; i++) {
      if (_eventList[i].id == id) {
        _eventList[i].isFavorite = false;
        notifyListeners();
      }
    }
  }

  ///$$$ LOAD SCROLL PIXEL $$$///
  Future<void> loadMore() async {
    if (_isLoadingPagination || _isLoadingEvent) return;
    _isLoadingPagination = true;
    page++;
    notifyListeners();
    if (page <= itemCount) {
      await getEventList();
    } else {
      _isLoadingPagination = false;
      notifyListeners();
    }
  }
}
