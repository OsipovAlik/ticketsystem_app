import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.5,
              color: Color.fromARGB(255, 4, 105, 78)));
            
  }
}


