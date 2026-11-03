import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ticketsystem/config/config.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/providers/event_item_provider/model/event_category_filter.dart';
import 'package:ticketsystem/providers/home_provider/model/event_model.dart';
import 'package:ticketsystem/screens/auth/login/login.dart';
import 'package:ticketsystem/services/api/favorite/favorite.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import '../../global/global.dart';
import '../../services/api/event/event.dart';



class EventItemProvider extends ChangeNotifier {
 bool _isVisible = false;
 List<EventModel> _list = [];
 List _eventFilterItems = [];
 String _startDate = "";
 String _endDate = "";
 String _startDay = "";
 String _endDay = "";
   final List _place = [];
  final List _theather = [];
 final List _city = [];
 late DateTime _startDateTime = DateTime.now();
 late DateTime _startEndTime = _startDateTime.add(const Duration(days: 0));


  bool get isVisible => _isVisible;
  List<EventModel> get list => _list;
  List get eventFilterItems => _eventFilterItems;
  String get startDate => _startDate;
  String get endDate => _endDate;
  String get startDay => _startDay;
  String get endDay => _endDay;
  List get place => _place;
  List get theather => _theather;
  List get city => _city;
  DateTime get startDateTime => _startDateTime;
  DateTime get startEndTime => _startEndTime;
  
Future<void> getAllData() async{
   _eventFilterItems = [];
   notifyListeners();
 await getEventList();
 await getEventItemsFilters();
}
  
Future<void> clearData() async{
  _city.clear();
  _place.clear();
  _theather.clear();
}




 Future<void> getEventList() async {  
    _isVisible = true;
    notifyListeners();
     Map<String, dynamic> body = {
    "page": 1,
    "count": 25,
    "categories": categoryListIdEvenItem,
    "startDate":_startDate,
    "endDate":_endDate,
    "name":"",
    "filter": {
    "place": _place,
    "theater": _theather,
    "city": _city
    // "place":[1,2,3] ,
    // "theather":[1] 
}
};
    String reqBody = jsonEncode(body);
    try {
      final res = await Event.shared.getEventList(reqBody);
      _list = EventModel.fromJsonList(res.resData["list"]);
       _isVisible = false;
      notifyListeners();
    } catch (err) {
   _isVisible = false;
      notifyListeners();
    } finally {
      _isVisible = false;
      notifyListeners();
    }
  }

   Future<void> getEventItemsFilters() async {  
    _place.clear();
    _theather.clear();
    _city.clear();
    Map<String, dynamic> body = {
      "categories": categoryListIdEvenItem
    };
    String reqBody = jsonEncode(body);
    try {
      final res = await Event.shared.getEventItemsFilters(reqBody);
      _eventFilterItems =  EventCategoryFilter.fromJsonList(res.resData);
     notifyListeners();
    } catch (err) {
      debugPrint("$err");
    }
  }

  void checkedPlace(String thName, String place) {
    if(place.isNotEmpty){
      _place.add(place);
    }else{
      _place.clear();
    }
   notifyListeners();
  }

  void clearAllFiltrList(){
    _place.clear();
    _theather.clear();
    _city.clear();
  }

  
  Future<dynamic> dateFilter(DateTime startDate,DateTime endDate) async{
    _startDateTime = startDate;
    _startEndTime = endDate;
     _startDate = startDate.toString();
     _endDate = endDate.toString();
     _startDay = formatStartDate(startDate.toString());
     _endDay = formatStartDate(endDate.toString());
     notifyListeners();
     await getEventList();
  }
  Future<dynamic> clearDateFilter() async{
    _startDate = "";
    _endDate = "";
    _startDay = "";
    _endDay = "";
    _startDateTime = DateTime.now();
    _startEndTime = _startDateTime.add(const Duration(days: 0));
    notifyListeners();
    await getEventList();

  }

Future<void> checkedItem(Item data, String key) async{
 if(key == "theater"){
     addTheatr(data);
   }else if(key == "place"){
     addPlace(data);
   }else if(key == "city"){
      addCity(data);
   }
}

void addTheatr(Item data){
  data.isChecked = !data.isChecked;
  if (data.isChecked) {
    _theather.add(data.key);
  } else {
    _theather.remove(data.key);
  }
  notifyListeners();
}
void addPlace(Item data){
  data.isChecked = !data.isChecked;
  if (data.isChecked) {
    _place.add(data.key);
  } else {
    _place.remove(data.key);
  }
  notifyListeners();
}
void addCity(Item data){
  data.isChecked = !data.isChecked;
  if (data.isChecked) {
    _city.add(data.key);
  } else {
    _city.remove(data.key);
  }
  notifyListeners();
}

Future<void> sendFilterItem() async{
   getEventList();
  notifyListeners();
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
  }else {
      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    }
}

    ///$$$ UPDATE lIST FAVORITE ITEM NO CALL API $$$///
  void updateProductFavorite(int id) {
    for (var i = 0; i < _list.length; i++) {
        if (_list[i].id == id) {
          _list[i].isFavorite = false;
          notifyListeners();
        }
    
    }
  }

void clearFilter(String key){
   if(key == "theater"){
     cleartheatr();
   }else if(key == "place"){
     clearPlaced();
   }else if(key == "city"){
      clearcity();
   }
}

  void clearPlaced(){
    _place.clear();
   
    // getEventItemsFilters();
     getEventList();
  }
  void cleartheatr(){
      _theather.clear();
  //  getEventItemsFilters();
      getEventList();
       
  }

  void clearcity(){
      _city.clear();
      //  getEventItemsFilters();
      getEventList();
       
  }
}