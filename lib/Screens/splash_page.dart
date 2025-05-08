// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:e_book_app/Helpers/common_widgets.dart';
import 'package:e_book_app/Helpers/utilities.dart';
import 'package:e_book_app/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        Get.off(HomePage());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.image + "splash.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.2),
            CommonWidgets().textWidget(
                text: "श्रीमद भगवद गीता",
                size: 25.0,
                weight: FontWeight.bold,
                align: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
