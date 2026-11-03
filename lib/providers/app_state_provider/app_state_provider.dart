import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
     final PageController _pageController = PageController();
  int _selectedIndex = 0;
  
  int get selectedIndex => _selectedIndex;
  PageController get pageController => _pageController;
  GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> ticketsNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> favoriteNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> searchNavigatorKey = GlobalKey<NavigatorState>();


 void resetNavigatorKeys() {
    homeNavigatorKey = GlobalKey<NavigatorState>();
    ticketsNavigatorKey = GlobalKey<NavigatorState>();
    favoriteNavigatorKey = GlobalKey<NavigatorState>();
    searchNavigatorKey = GlobalKey<NavigatorState>();
    notifyListeners();
  }

  void  onItemTapped(int index) {
    final currentNavigatorKey = [
      homeNavigatorKey,
      ticketsNavigatorKey,
      favoriteNavigatorKey,
      searchNavigatorKey
    ][index];
  if (_selectedIndex == index) {
    currentNavigatorKey.currentState?.popUntil((route) => route.isFirst);
  } else {
      _selectedIndex = index;
   notifyListeners();
  }
}

   Future<bool> onWillPop() async {

  if (homeNavigatorKey.currentState?.canPop() == true) {
      homeNavigatorKey.currentState?.pop();
      return false; 
    }
    if (ticketsNavigatorKey.currentState?.canPop() == true) {
      ticketsNavigatorKey.currentState?.pop();
      return false; 
    }
     if (favoriteNavigatorKey.currentState?.canPop() == true) {
      favoriteNavigatorKey.currentState?.pop();
      return false; 
    }
    if (searchNavigatorKey.currentState?.canPop() == true) {
      searchNavigatorKey.currentState?.pop();
      return false; 
    }
  if(_selectedIndex == 0){
       return true;
    }else{

      _selectedIndex = 0;
      _pageController.jumpToPage(_selectedIndex);
     notifyListeners();
        return false;
    }
  }

  // // Method to handle repeat order
  void repeatOrder(int index) {
    onItemTapped(index);
    _pageController.jumpToPage(index);
    notifyListeners();
  }
}
