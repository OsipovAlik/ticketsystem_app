import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/providers/event_item_provider/model/event_category_filter.dart';
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

  /// "This Week" row — events starting within the next 7 days, independent
  /// of the paginated/filtered main list and the category/date chips.
  List<EventModel> _thisWeekList = [];
  bool _isLoadingThisWeek = false;

  /// One short event list per category id, used to render a horizontal
  /// carousel per category ("All of Armenia's events in one place").
  Map<String, List<EventModel>> _categoryRows = {};
  bool _isLoadingCategoryRows = false;

  /// Filter option groups (place/theater/city) for the "Cities" row — the
  /// same `/event/filter-list` data EventItemProvider uses, fetched
  /// independently here so the Home screen's own filters don't interfere
  /// with the dedicated advanced-search screen's state.
  ///
  /// NOT used for "Cinemas" below: this `theater` group is every venue in
  /// the system (concert halls, drama theaters, even bars), unscoped by
  /// category — confirmed by checking ticketsystem.am's own `/events/filter`
  /// page, which has the same unscoped venue list. The real homepage's
  /// "Cinemas" row instead lists only venues that actually have Cinema-
  /// category events, which is what [_cinemaVenues] reproduces below.
  List<EventCategoryFilter> _filterGroups = [];
  bool _isLoadingFilters = false;
  final List _theaterFilter = [];
  final List _cityFilter = [];

  /// Venues derived from real Cinema-category events ([EventModel.thName]/
  /// [EventModel.thNameKey]), so "Cinemas" only ever lists actual cinemas —
  /// never concert halls or other theater-category venues.
  List<Item> _cinemaVenues = [];
  bool _isLoadingCinemaVenues = false;

  /// Shared by the Home and Search screens so the typed query and the
  /// clear button stay in sync no matter which screen the user searches
  /// from.
  final TextEditingController searchController = TextEditingController();

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
  List<EventModel> get thisWeekList => _thisWeekList;
  bool get isLoadingThisWeek => _isLoadingThisWeek;
  Map<String, List<EventModel>> get categoryRows => _categoryRows;
  bool get isLoadingCategoryRows => _isLoadingCategoryRows;
  bool get isLoadingFilters => _isLoadingFilters;
  bool get isLoadingCinemaVenues => _isLoadingCinemaVenues;
  List<Item> get cinemas => _cinemaVenues;
  List<Item> get cities => _itemsForFilterKey("city");

  List<Item> _itemsForFilterKey(String key) {
    for (final group in _filterGroups) {
      if (group.key == key) return group.items;
    }
    return const [];
  }



  void getAllData() {
    page = 1;
    itemCount = 1;
    _isLoadingEvent = true;
    getCategory().then((_) {
      getCategoryRows();
      getCinemaVenues();
    });
    getBanner();
    getEventList();
    getDate();
    getThisWeek();
    getFilterGroups();
  }

  /// Finds the real "Cinema" category (by name, since category ids are
  /// backend-assigned and not stable to hardcode) and derives the "Cinemas"
  /// row from the venues of its actual events — see the field doc above for
  /// why the generic `theater` filter group can't be used for this.
  Future<void> getCinemaVenues() async {
    CategoryModel? cinemaCategory;
    for (final category in _categoryList) {
      final name = category.name.toLowerCase();
      if (name.contains('cinema') || name.contains('movie')) {
        cinemaCategory = category;
        break;
      }
    }
    if (cinemaCategory == null) {
      _cinemaVenues = [];
      notifyListeners();
      return;
    }
    _isLoadingCinemaVenues = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "page": 1,
      "count": 50,
      "categories": [cinemaCategory.id],
      "startDate": "",
      "endDate": "",
      "name": "",
    };
    try {
      final res = await Event.shared.getEventList(jsonEncode(body));
      final events = EventModel.fromJsonList(res.resData["list"]);
      final seenKeys = <String>{};
      final venues = <Item>[];
      for (final event in events) {
        if (event.thNameKey.isEmpty || !seenKeys.add(event.thNameKey)) continue;
        venues.add(Item(
          key: event.thNameKey,
          value: event.thName,
          isChecked: _theaterFilter.contains(event.thNameKey),
        ));
      }
      _cinemaVenues = venues;
    } catch (err) {
      _cinemaVenues = [];
    } finally {
      _isLoadingCinemaVenues = false;
      notifyListeners();
    }
  }

  /// Fetches the place/theater/city filter option groups used by the
  /// "Cinemas" and "Cities" rows.
  Future<void> getFilterGroups() async {
    _isLoadingFilters = true;
    notifyListeners();
    Map<String, dynamic> body = {"categories": []};
    try {
      final res = await Event.shared.getEventItemsFilters(jsonEncode(body));
      _filterGroups = EventCategoryFilter.fromJsonList(res.resData);
    } catch (err) {
      _filterGroups = [];
    } finally {
      _isLoadingFilters = false;
      notifyListeners();
    }
  }

  /// Toggles a cinema (theater) filter on the main event list, same
  /// backend contract the advanced-search screen uses.
  void toggleCinemaFilter(Item item) {
    item.isChecked = !item.isChecked;
    if (item.isChecked) {
      _theaterFilter.add(item.key);
    } else {
      _theaterFilter.remove(item.key);
    }
    page = 1;
    notifyListeners();
    getEventList();
  }

  /// Toggles a city filter on the main event list.
  void toggleCityFilter(Item item) {
    item.isChecked = !item.isChecked;
    if (item.isChecked) {
      _cityFilter.add(item.key);
    } else {
      _cityFilter.remove(item.key);
    }
    page = 1;
    notifyListeners();
    getEventList();
  }

  /// Fetches events starting within the next 7 days for the "This Week" row.
  Future<void> getThisWeek() async {
    _isLoadingThisWeek = true;
    notifyListeners();
    final now = DateTime.now().toUtc();
    final weekEnd = now.add(const Duration(days: 7));
    Map<String, dynamic> body = {
      "page": 1,
      "count": 20,
      "categories": [],
      "startDate": now.toIso8601String(),
      "endDate": weekEnd.toIso8601String(),
      "name": "",
    };
    try {
      final res = await Event.shared.getEventList(jsonEncode(body));
      _thisWeekList = EventModel.fromJsonList(res.resData["list"]);
    } catch (err) {
      _thisWeekList = [];
    } finally {
      _isLoadingThisWeek = false;
      notifyListeners();
    }
  }

  /// Fetches a short event list per category, for the per-category
  /// carousels. Runs after [getCategory] has populated [_categoryList].
  /// A category with no events (or a failed request) is simply left out of
  /// the result map rather than shown as an empty/broken row.
  Future<void> getCategoryRows() async {
    if (_categoryList.isEmpty) return;
    _isLoadingCategoryRows = true;
    notifyListeners();
    final Map<String, List<EventModel>> rows = {};
    await Future.wait(_categoryList.map((category) async {
      try {
        Map<String, dynamic> body = {
          "page": 1,
          "count": 10,
          "categories": [category.id],
          "startDate": "",
          "endDate": "",
          "name": "",
        };
        final res = await Event.shared.getEventList(jsonEncode(body));
        final list = EventModel.fromJsonList(res.resData["list"]);
        if (list.isNotEmpty) {
          rows[category.id] = list;
        }
      } catch (err) {
        // Skip this category's row on error; the others still render.
      }
    }));
    _categoryRows = rows;
    _isLoadingCategoryRows = false;
    notifyListeners();
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
    searchController.clear();
    notifyListeners();
    page = 1;
    _searchDebounce?.cancel();
    getEventList();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    searchController.dispose();
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
      "name": _serarch,
      "filter": {
        "place": [],
        "theater": _theaterFilter,
        "city": _cityFilter,
      },
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
