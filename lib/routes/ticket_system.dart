import 'dart:async';
// import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/firebase/firebase_funcion.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/models/nav_item_model.dart';
import 'package:ticketsystem/providers/app_state_provider/app_state_provider.dart';
import 'package:ticketsystem/providers/home_provider/home_provider.dart';
import 'package:ticketsystem/routes/pages_route/favorite_route/favorite_route.dart';
import 'package:ticketsystem/routes/pages_route/search_route/search_route.dart';
import 'package:ticketsystem/routes/pages_route/tickets_route/tickets_route.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/widget/snackbar_util/snackbar_util.dart';
import 'pages_route/home_route/home_route.dart';

class TicketSystem extends StatefulWidget {
  const TicketSystem({super.key});

  @override
  TicketSystemState createState() => TicketSystemState();
}

class TicketSystemState extends State<TicketSystem> {
  final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint("$e");
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  /// update check internet
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (result[0] == ConnectivityResult.none) {
      SnackbarUtil.showSnackBarColors(
          context, S.current.no_connected, CustomColors.blueLight, 'lib/assets/svg/wifi.svg', initConnectivity, homeProvider);
    } else {
      if (mounted) {
        initConnectivity();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        homeProvider.getAllData();
      }
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    }
  }

  @override
  void initState() {
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await FirebaseService.shared.initializeFirebase(context);
    });
    super.initState();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    // if (Platform.isAndroid) {
    //   initConnectivity();
    // }
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  /// Tab labels in the same order as [bottomNavItems]/the PageView children.
  String _tabLabel(int index) {
    switch (index) {
      case 0:
        return S.current.nav_home;
      case 1:
        return S.current.tickets;
      case 2:
        return S.current.favorite;
      default:
        return S.current.nav_search;
    }
  }

  Widget _navIcon(int index, {required bool selected}) {
    return SvgPicture.asset(
      bottomNavItems[index].src,
      width: 24,
      colorFilter: ColorFilter.mode(
        selected ? Colors.black : Color.fromARGB(255, 59, 62, 66),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);

    return GlassScaffold(
      // Keep the existing (non-overlapping) body/bar layout instead of the
      // package's default floating-over-content look — the 4 tab routes
      // weren't built with extra bottom padding to clear a floating bar.
      extendBody: true,
      backgroundColor: Colors.transparent,
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: appState.onWillPop,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: appState.pageController,
          children: [
            HomeRoute(navigatorKey: appState.homeNavigatorKey),
            TicketsRoute(navigatorKey: appState.ticketsNavigatorKey),
            FavoriteRoute(navigatorKey: appState.favoriteNavigatorKey),
            SearchRoute(navigatorKey: appState.searchNavigatorKey),
          ],
        ),
      ),
      bottomBar: GlassTabBar.bottom(
        selectedIndex: appState.selectedIndex,
        onTabSelected: (index) {
          appState.pageController.jumpToPage(index);
          appState.onItemTapped(index);
        },
        indicatorColor: Colors.transparent,
        selectedLabelColor: Colors.black,
        unselectedLabelColor: Color.fromARGB(255, 59, 62, 66),
        tabs: List.generate(bottomNavItems.length, (index) {
          return GlassTab(
            icon: _navIcon(index, selected: false),
            activeIcon: _navIcon(index, selected: true),
            label: _tabLabel(index),
            glowColor: const Color.fromARGB(255, 207, 207, 207),
          );
        }),
      ),
    );
  }
}
