import 'package:flutter/material.dart';
import 'package:ticketsystem/screens/event_details/details.dart';
import 'package:ticketsystem/screens/tickets/tickets.dart';


class TicketsRoute extends StatelessWidget {
final GlobalKey<NavigatorState> navigatorKey;
const TicketsRoute({ super.key, required this.navigatorKey});

@override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => const Tickets();
            break;
         case '/detail':
            builder = (BuildContext context) => const Details();
            break;
          default:
            builder = (BuildContext context) => const Tickets();
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
