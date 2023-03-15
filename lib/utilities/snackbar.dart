import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizon_comfort/utilities/constants.dart';

showSB(
    {required String title,
    required String message,
    required Color titleColor}) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      titleText: Text(
        title,
        style: kTypewriterTitleBoldTextStyle.copyWith(
            color: titleColor, fontSize: 20),
      ),
      messageText: Text(message,
          style:
              kTypewriterTextStyle.copyWith(color: Colors.white, fontSize: 18)),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1500),
    ),
  );
}
