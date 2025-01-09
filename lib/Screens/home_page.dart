// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:e_book_app/Controllers/home_controller.dart';
import 'package:e_book_app/Helpers/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helpers/common_widgets.dart';

class HomePage extends StatelessWidget {
  HomeController _homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: CommonWidgets().textWidget(
              text: "श्रीमद भगवद गीता",
              size: 25.0,
              weight: FontWeight.bold,
              align: TextAlign.center),
        ),
        body: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return listWidget(
              shlokname: "Naimish",
            );
          },
        ));
  }

  Widget listWidget({shlokname}) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.black,
          ),
          CommonWidgets()
              .textWidget(text: shlokname, size: 20.0, weight: FontWeight.w700),
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
