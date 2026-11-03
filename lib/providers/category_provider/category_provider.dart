import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/providers/home_provider/home_provider.dart';
import 'package:ticketsystem/services/api/event/event.dart';

class CategoryProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _categorySelectName = "";
  List<CategoryModel> _categoryList = [];

  bool get isLoading => _isLoading;
  List<CategoryModel> get categoryList => _categoryList;
  String get categorySelectName => _categorySelectName;

  Future<void> getCategory() async {
    _isLoading = true;
    notifyListeners();
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
        _isLoading = false;
        notifyListeners();
    } catch (err) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void getAllEvent(BuildContext context, CategoryModel data){
    for(var i = 0; i<_categoryList.length; i++ ){
        if(_categoryList[i].id == data.id){
             _categoryList[i].isActive = !_categoryList[i].isActive;
        }else{
            _categoryList[i].isActive = false;
            
        }
     
    }
    notifyListeners();
    Provider.of<HomeProvider>(context, listen: false).getEventList();
  }

void checkedFilter(CategoryModel data) {
   data.isActive = !data.isActive;
   _categorySelectName = data.name;
  //  getCategory();
   notifyListeners();
}

void checkedDetailFilter(String id, String categoryName) {
  for(var i = 0; i < _categoryList.length;i++){
      if(id == _categoryList[i].id){
          _categoryList[i].isActive = true;
      }else{
         _categoryList[i].isActive = false;
      }
  }
   _categorySelectName = categoryName;
   notifyListeners();
}


void checkedPlaceFilter(String place) {

   notifyListeners();
}

void clearSelectedName(BuildContext context){
  _categorySelectName = "";
  
    for(var i = 0; i<_categoryList.length; i++ ){
        _categoryList[i].isActive = false;
    }
  notifyListeners();
}
  //   Future<void> searchCategory(String value) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   // Map<String, dynamic> body = {
  //   //   "page": 1,
  //   //   "count": 100,
  //   //   "startDate": "16-11-2024 12:00",
  //   //   "endDate": "28-12-2024 00:59"
  //   // };

  //   // String reqBody = jsonEncode(body);

  //   try {
  //     // final res = await Event.shared.getCategory(reqBody);
  //     //   _categoryList = CategoryModel.fromJsonList(res.resData["list"]);
  //       _isLoading = false;
  //       notifyListeners();
  //   } catch (err) {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
