import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:android_id/android_id.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketsystem/global/global.dart';

// import '../services/services.dart';

class DeviceUtils {
  // Global method to initialize SharedPreferences and set the language
  static Future<void> initializeLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    globalToken = prefs.getString('token') ?? '';
    globalLanguage = prefs.getString('globalLanguage') ?? "en";
    phone = prefs.getString("phone") ?? '';
    name = prefs.getString("name") ?? '';
    email = prefs.getString("email") ?? '';
    changeLanguage(globalLanguage);
    guest = globalToken.isEmpty;
  }

  static Future<void> initializeOsType() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    const androidIdPlugin = AndroidId();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersionCode = "${packageInfo.version}.${packageInfo.buildNumber}";

    // if (globalToken.isNotEmpty) {
    //   devicetoken = await messaging.getToken() ?? "";

    //   log(devicetoken);
    //   // Services.setdeviceToken(devicetoken);
    // }

    if (Platform.isAndroid) {
      osType = "1";
      deviceId = await androidIdPlugin.getId() ?? "";
    } else if (Platform.isIOS) {
      osType = "2";
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor ?? "";
    }
  }
}

changeLanguage(globalLanguage) {
  if (globalLanguage == "hy") {
    globalEng = "3";
  } else if (globalLanguage == "ru") {
    globalEng = "2";
  } else {
    globalEng = "1";
  }
}
