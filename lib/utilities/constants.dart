import 'package:flutter/material.dart';

const kBackgroundColor = Color(0x00049fb6); // 303030

const kHorizonTextStyle = TextStyle(
  color: Colors.black54,
  fontFamily: 'Horizon',
  fontSize: 300,
  fontWeight: FontWeight.w600,
);

const kHorizonTextStyleBold = TextStyle(
  color: Colors.black87,
  fontFamily: 'Horizon',
  fontSize: 300,
  fontWeight: FontWeight.bold,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0xFFF5F6EF),
  hintText: 'Enter your email',
  hintStyle: TextStyle(
    color: Colors.black87,
  ),
  labelStyle: TextStyle(
    color: Colors.black87,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black87, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black87, width: 6.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
