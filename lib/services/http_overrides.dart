import 'dart:io';

/// No longer bypasses certificate validation — relies on the platform's
/// default (secure) HttpClient behavior.
class MyHttpOverrides extends HttpOverrides {}
