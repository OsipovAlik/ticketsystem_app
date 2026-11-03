import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS/macOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class EventChart extends StatefulWidget {
  const EventChart({super.key});

  @override
  EventChartState createState() => EventChartState();
}

class EventChartState extends State<EventChart> {
  late final WebViewController _controller; // Remove nullable type

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features
// https://ticketsystem.am/event
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // onPageStarted: (String url) {
          //   debugPrint('Page started loading: $url');
          // },
          onPageFinished: (String url) {
            // if (url.contains("/success")) {
            //   _success();
            // }else if(url.contains("/warning")){
            //   _failed();
            // }
            // debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            // _failed();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.ticketsystem.am')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            // debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            if (change.url!.contains("/success")) {
              // qci order upcoming
               Navigator.of(context).pop();
              _success();
            }else if(change.url!.contains("/warning")){
              log("${change.url}");
              Navigator.of(context).pop();
              _failed();
            }
          },
          onHttpAuthRequest: (HttpAuthRequest request) {},
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(webViewLink));

    // setBackgroundColor is not currently supported on macOS.
    if (kIsWeb || !Platform.isMacOS) {
      controller.setBackgroundColor(const Color.fromARGB(128, 5, 6, 70));
    }

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: CustomColors.blueBold,
        centerTitle: true,
        title: Text(S.current.tickets, style: ThemeText.w18b),
        leading: IconButton(
          icon: Icon(Icons.close,
              color: Colors.white), // Change the icon and color here
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: CustomColors.blueLight,
      body: Container(
          alignment: Alignment.center,
          child: WebViewWidget(controller: _controller)),
    );
  }
Future<void> _success() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CustomColors.blueBold,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Lottie.asset(
                'lib/assets/lottie/success.json',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
                frameRate: FrameRate.max,
              ),
              Text(S.current.thank_you,style: ThemeText.w16b,textAlign: TextAlign.center,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(S.current.close,style: ThemeText.w14b),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
Future<void> _failed() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CustomColors.blueBold,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Lottie.asset(
                'lib/assets/lottie/failed.json',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
                frameRate: FrameRate.max,
              ),
              Text(S.current.failed,style: ThemeText.w16b,textAlign: TextAlign.center,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(S.current.close,style: ThemeText.w14b),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}
