
import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ticketsystem/firebase/firebase_options.dart';
import 'package:ticketsystem/notification/notification.dart';
import 'package:ticketsystem/routes/routes.dart';
import 'package:ticketsystem/utils/device_utils.dart';
import 'package:ticketsystem/utils/restart_widget/restart_widget.dart';
import 'services/http_overrides.dart';
import 'package:upgrader/upgrader.dart';



///new version 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);  

  await Upgrader.clearSavedSettings();
  await NotificationService.init();
  // Initializes the app's language settings.
  await DeviceUtils.initializeLanguage();
  await DeviceUtils.initializeOsType();
  runApp(RestartWidget(child: const TicketSystemApp()));
}
   