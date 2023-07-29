import 'package:flutter/material.dart';
import 'package:jdih/styles/colors.dart';

PreferredSizeWidget appBarPage(String title, BuildContext context) {
  return AppBar(
    leadingWidth: 90,
    leading: IconButton.filled(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => AppColors.textColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        )),
    toolbarHeight: 90,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Text(title,
            style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 26,
                fontWeight: FontWeight.w500)),
      ),
    ],
  );
}
