import 'package:flutter/material.dart';

const kHorizonTextStyle = TextStyle(
  color: Colors.white70,
  fontFamily: 'Horizon',
  fontSize: 300,
  fontWeight: FontWeight.w100,
);

const kHorizonTextStyleBold = TextStyle(
  color: Colors.white70,
  fontFamily: 'Horizon',
  fontSize: 300,
  fontWeight: FontWeight.bold,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black54,
  hintText: 'Enter your email',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  labelStyle: TextStyle(
    color: Colors.white,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
