import 'package:flutter/material.dart';

class AppColors {
  static const userNameText = Color.fromRGBO(82, 125, 207, 1);
  static const headerText = Color.fromRGBO(0, 0, 0, 1);
  static const labelText = Color.fromRGBO(34, 34, 34, 1);
  static const footerText = Color.fromRGBO(8, 8, 8, 1);

  static const icon = Color.fromRGBO(68, 68, 68, 1);
  static const onStepIcon = Color.fromRGBO(193, 182, 168, 1);
  static const offStepIcon = Color.fromRGBO(255, 255, 255, 0);
  static const agricultureIcon = Color.fromRGBO(115, 203, 174, 1);
  static const onButton = Color.fromRGBO(255, 255, 255, 1);

  static const background = Color.fromRGBO(252, 249, 245, 1);
  static const iconBackground = Color.fromRGBO(240, 235, 229, 1);

  static const greenButton = Color.fromRGBO(0, 182, 123, 1);
  static const blueButton = Color.fromRGBO(0, 122, 255, 1);
  static const orangeButton = Color.fromRGBO(236, 147, 19, 1);

  static const border = Color.fromRGBO(235, 227, 217, 1);
  static const divider = Color.fromRGBO(221, 221, 221, 1);

  static const innerBackground = Color.fromRGBO(255, 255, 255, 1);
  static const subsidyListBackground = Color.fromRGBO(55, 181, 139, 1);
  static const postalTextBackground = Color.fromRGBO(247, 247, 247, 1);
  static const addSubsidyAlarm = Color.fromRGBO(255, 231, 66, 1);

  static const settingMenuLabel = Color.fromRGBO(0, 0, 0, 1);
  static const settingMenuIcon = Color.fromRGBO(0, 0, 0, 1);
  static const settingMenuIconBackground = Color.fromRGBO(244, 244, 244, 1);
}

class AppTextStyles {
  static const subsidyTitle = TextStyle(
    color: AppColors.onButton,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const header1 = TextStyle(
    color: AppColors.labelText,
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );

  static const header2 = TextStyle(
    color: AppColors.labelText,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const userName = TextStyle(
    color: AppColors.userNameText,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const labelBold = TextStyle(
    fontSize: 16,
    color: AppColors.labelText,
    fontWeight: FontWeight.bold,
  );

  static const label = TextStyle(
    fontSize: 16,
    color: AppColors.labelText,
  );

  static const button = TextStyle(
    color: AppColors.onButton,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const buttonBig = TextStyle(
    color: AppColors.onButton,
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );

  static const footer = TextStyle(
    color: AppColors.footerText,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );

  static const whiteButton = TextStyle(
    color: AppColors.labelText,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const addSubsidyAlarmText = TextStyle(
    color: AppColors.addSubsidyAlarm,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const settingMenuLabel = TextStyle(
    color: AppColors.settingMenuLabel,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
