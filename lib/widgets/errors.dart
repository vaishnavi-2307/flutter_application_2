import 'package:flutter/material.dart';

class ErrorTxt extends StatelessWidget {
  //
  final String message;
  final VoidCallback onTap;
   ErrorTxt({required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
