import 'dart:core';
import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/routes/ticket_system.dart';
import 'package:ticketsystem/services/api/auth/auth.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import '../../services/services.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
 

  bool get isLoading => _isLoading;



  Future<void> login(BuildContext context, Object body) async {
    _isLoading = true;
    notifyListeners();

    try {
      final res = await Auth.shared.loginUser(body);
    
      if(res.success){
        globalToken = res.token;
        name = res.name;
        email = res.email;
        phone = res.phone;
       _isLoading = false;
        guest = false;
        Services.setToken(globalToken);
        Services.setPhone(phone);
        Services.setName(name);
        Services.setEmail(email);
        notifyListeners();
         Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (context) => const TicketSystem()),
            (Route<dynamic> route) => false, // Removes all routes from the stack
           );
      }else{
         _isLoading = false;
        notifyListeners();
        SnackbarUtil.showSnackbar(context, res.message);
      }
       
    } catch (err) {
      _isLoading = false;
      notifyListeners();
     SnackbarUtil.showSnackbar(context, S.current.system_error,
       duration: Duration(milliseconds: 500)); 
    }
  }

  
Future<void> register(BuildContext context, Object body) async {
    _isLoading = true;
    notifyListeners();
    try {
      final res =  await Auth.shared.registerUser(body);
     if(res.success){
        globalToken = res.token;
        name = res.name;
        email = res.email;
        phone = res.phone;
       _isLoading = false;
        guest = true;
        Services.setToken(globalToken);
        Services.setPhone(phone);
        Services.setName(name);
        Services.setEmail(email);
        notifyListeners();
         Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (context) => const TicketSystem()),
            (Route<dynamic> route) => false, // Removes all routes from the stack
           );
      }else{
         _isLoading = false;
        notifyListeners();
        SnackbarUtil.showSnackbar(context, res.message);
      }
    } catch (err) {
      _isLoading = false;
      notifyListeners();
       SnackbarUtil.showSnackbar(context, S.current.system_error,
       duration: Duration(milliseconds: 500)); 
    }
  }
}
