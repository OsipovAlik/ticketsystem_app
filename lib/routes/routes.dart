import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:upgrader/upgrader.dart';
import '../../generated/l10n.dart';
import '../providers/language_provider/language_provider.dart';
import '../providers/providers.dart';
import 'ticket_system.dart';

class TicketSystemApp extends StatefulWidget {
  const TicketSystemApp({super.key});

  @override
  State<TicketSystemApp> createState() => _TicketSystemApp();
}

class _TicketSystemApp extends State<TicketSystemApp> {
  String initialRoute = '/';
  static const String _title = 'TicketSystemApp';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(
          builder: (context) => GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                child: MaterialApp(
                  // color: CustomColors.blueBold,
                  builder: (context, child) {
                    return MediaQuery(
                      // ignore: deprecated_member_use
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child!,
                    );
                  },
                  // theme: Provider.of<ThemeProvider>(context).themeData,
                  // darkTheme: darkMode,
                  theme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: CustomColors.blueBold,
                    dialogBackgroundColor: CustomColors.blueBold, // Ensure modal visibility
                  ),
                  themeMode: ThemeMode.dark,
                  debugShowCheckedModeBanner: false,
                  title: _title,
                  locale: Provider.of<LanguageProvider>(context, listen: true)
                      .currentLocale,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    S.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  initialRoute: initialRoute,
                  home: UpgradeAlert(
                dialogStyle: Platform.isIOS
                    ? UpgradeDialogStyle.cupertino
                    : UpgradeDialogStyle.material,
                child:  const TicketSystem()
              ),
                 
                ),
              )),
    );
  }
}
