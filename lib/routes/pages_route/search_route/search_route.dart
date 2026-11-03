import 'package:flutter/material.dart';
import 'package:ticketsystem/screens/event_details/details.dart';
import 'package:ticketsystem/screens/search/search.dart';


class SearchRoute extends StatelessWidget {
final GlobalKey<NavigatorState> navigatorKey;
const SearchRoute({ super.key, required this.navigatorKey});

@override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => const Search();
            break;
         case '/detail':
            builder = (BuildContext context) => const Details();
            break;
          default:
            builder = (BuildContext context) => const Search();
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
