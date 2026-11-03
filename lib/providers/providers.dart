import 'package:provider/provider.dart';
import 'package:ticketsystem/providers/app_state_provider/app_state_provider.dart';
import 'package:ticketsystem/providers/auth_provider/auth_provider.dart';
import 'package:ticketsystem/providers/category_provider/category_provider.dart';
import 'package:ticketsystem/providers/event_item_provider/event_item_provider.dart';
import 'package:ticketsystem/providers/favorite_provider/favorite_provider.dart';
import 'package:ticketsystem/providers/home_provider/home_provider.dart';
import 'package:ticketsystem/providers/language_provider/language_provider.dart';
import 'package:ticketsystem/providers/profile_provider/profile_provider.dart';
import 'package:ticketsystem/providers/search_provider/search_provider.dart';
import 'package:ticketsystem/providers/theme_provider/theme_provider.dart';
import 'package:ticketsystem/providers/ticket_details_provider/ticket_details_provider.dart';
import 'package:ticketsystem/providers/tickets_provider/tickets_provider.dart';

///$$$ GLOBAL CONFIG LIST ALL PAGE: MULTIPROVIDERS ///$$$
final List<ChangeNotifierProvider> providers = [
   ///$$$ PP STATE PROVIDER ///$$$
  ChangeNotifierProvider<AppStateProvider>(create: (context) => AppStateProvider()),
   ///$$$ AUTH PROVIDER ///$$$
  ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ///$$$ THEME PROVIDER ///$$$
  ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),
  ///$$$ LANGUAGE PROVIDER ///$$$
  ChangeNotifierProvider<LanguageProvider>(create: (context) => LanguageProvider()),
        ///$$$ HomeProvider PROVIDER ///$$$
  ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
      ///$$$ CATEGORY PROVIDER ///$$$
  ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider()),
      ///$$$ FAVORITE PROVIDER ///$$$
  ChangeNotifierProvider<FavoriteProvider>(create: (context) => FavoriteProvider()),
      ///$$$ SEARCH PROVIDER ///$$$
  ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
      ///$$$ EVENT ITEM PROVIDER ///$$$
  ChangeNotifierProvider<EventItemProvider>(create: (context) => EventItemProvider()),
      ///$$$ PROFILE PROVIDER ///$$$
  ChangeNotifierProvider<ProfileProvider>(create: (context) => ProfileProvider()),
      ///$$$ TICKETS PROVIDER ///$$$
  ChangeNotifierProvider<TicketsProvider>(create: (context) => TicketsProvider()),
      ///$$$ TICKETS DETAILS PROVIDER ///$$$
  ChangeNotifierProvider<TicketDetailsProvider>(create: (context) => TicketDetailsProvider()),
];
