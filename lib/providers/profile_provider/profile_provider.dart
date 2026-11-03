import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/screens/auth/login/login.dart';
import 'package:ticketsystem/services/api/auth/auth.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';


class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _onLoading = false;
  final List _list = [];
  File? userImg; 

  bool get isLoading => _isLoading;
  bool get onLoading => _onLoading;
  List get list => _list;

  Future<void> getUser() async {
    _isLoading = true;
    notifyListeners();
    // Map<String, dynamic> body = {
    //   "page": 1,
    //   "count": 100,
    //   "startDate": "16-11-2024 12:00",
    //   "endDate": "28-12-2024 00:59"
    // };

    // String reqBody = jsonEncode(body);

    try {
      // final res = await Event.shared.getCategory(reqBody);
      //   _categoryList = CategoryModel.fromJsonList(res.resData["list"]);
        _isLoading = false;
        notifyListeners();
    } catch (err) {
      _isLoading = false;
      notifyListeners();
    }
  }

Future<void> signOut( BuildContext context) async {
    try {
      // await Login.shared.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('address');
        globalToken = "";
        guest = true;
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => const Login()));
    } catch (e) {
      debugPrint('Error during sign-out: $e');
      // Handle the error appropriately, e.g., show an error message to the user
    }
  }

  Future<void> signIn( BuildContext context) async {
      Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => const Login()));
  }

 Future<void> removeMyAccount(BuildContext context) async {
  _onLoading = true;
  notifyListeners();
    try {
      final res = await Auth.shared.removeAccount();
      if (res.success) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        globalToken = "";
        guest = true;
        _onLoading = false;
        Navigator.pop(context);
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => const Login()));
      } else {
        SnackbarUtil.showSnackbar(context, res.message);
        _onLoading = false;
      }
    } catch (err) {
      SnackbarUtil.showSnackbar(context, S.current.system_error);
      _onLoading = false;
    }
  }

    Future<void> picImage() async {
    try {
      var pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
        userImg = File(pickedImage.path);
        notifyListeners();
    } catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }
  
}