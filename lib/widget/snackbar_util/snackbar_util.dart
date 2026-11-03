import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/l10n.dart';
import '../../theme/custom_colors.dart';
import '../../theme/styles_text.dart';
// Replace with your actual import

class SnackbarUtil {
  static void showSnackbar(BuildContext context, String message,  {Duration duration = const Duration(seconds: 3)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CustomColors.blueLight,
        content: Text(
          message,
          style: ThemeText.w12,
        ),
        duration: duration,
      ),
      
    );
    
  }

  static  void showSnackBarColor(BuildContext context, String? message, Color color,String svg) {
    final snackBar = SnackBar(
      // duration: Duration.zero,
      content: Row(
      children: [
        SvgPicture.asset(svg, 
          colorFilter: ColorFilter.mode(
             Colors.white, // Inactive color
             BlendMode.srcIn,
          )),
          SizedBox(width: 16),
        Text(message!,style: ThemeText.w14b),
      ],
    ), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
 static void showSnackBarColors(BuildContext context, String message, Color backgroundColor, String iconPath,initConnectivity,provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding:EdgeInsets.all(2.0) ,
        content: Row(
          spacing: 2,
          children: <Widget>[
            SizedBox(width: 12.0),
            SizedBox(
              height: 24,
              width: 24,
              child:   SvgPicture.asset(iconPath, 
          colorFilter: ColorFilter.mode(
             Colors.white, // Inactive color
             BlendMode.srcIn,
          )), // Assuming you're using an image asset
            ),
            SizedBox(width: 8),
            Text(message,style: ThemeText.w12b),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: Duration(days: 1), // Set a long duration or use `null` to keep it open indefinitely
        action: SnackBarAction(
          label: S.current.refresh,
          textColor: Colors.white,
          onPressed: () {
            initConnectivity();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            provider.getAllData();
          },
        ),
      ),
    );
  }
  
}
