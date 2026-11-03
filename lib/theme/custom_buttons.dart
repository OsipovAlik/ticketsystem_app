import 'package:flutter/material.dart';

abstract class CustomButtons {
  static final whitedButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: Colors.white,
    // textStyle: ThemeText.b16,
  );

  static final byTicket = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent, // Make button transparent
    shadowColor: Colors.transparent, // Remove shadow
  );

  static final counterOutStyledButton = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: Colors.white,
  );
  static final readButton = ButtonStyle(
    padding: WidgetStateProperty.all(EdgeInsets.zero),
    minimumSize: WidgetStateProperty.all(Size.zero),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
