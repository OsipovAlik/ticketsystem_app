import 'package:flutter/material.dart';
import 'package:ticketsystem/screens/event_details/details.dart';
import 'package:ticketsystem/screens/favorites/favorites.dart';


class FavoriteRoute extends StatelessWidget {
final GlobalKey<NavigatorState> navigatorKey;
const FavoriteRoute({ super.key, required this.navigatorKey});

@override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => const Favorites();
            break;
          case '/detail':
            builder = (BuildContext context) => const Details();
            break;
          default:
            builder = (BuildContext context) => const Favorites();
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
