// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:e_book_app/Helpers/utilities.dart';
import 'package:e_book_app/Screens/shlok_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Helpers/common_widgets.dart';

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> readJson() async {
    final String response = await rootBundle.loadString('assets/shlokas.json');
    return json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.orangeColor,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: CommonWidgets().textWidget(
            text: "श्रीमद भगवद गीता",
            size: 25.0,
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
            align: TextAlign.center),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final chapters = snapshot.data!['hi'] as Map<String, dynamic>;
            return ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final key = chapters.keys.elementAt(index);
                final value = chapters[key];
                return GestureDetector(
                  onTap: () {
                    Get.to(ShlokaList(chapter: "${index + 1}".toString()));
                  },
                  child: listWidget(shlokname: "अध्याय ${key}"),
                );
              },
            );
          } else {
            return const Center(child: Text("No data available."));
          }
        },
      ),
    );
  }

  Widget listWidget({shlokname}) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: AppColors.primaryColor,
          ),
          CommonWidgets()
              .textWidget(text: shlokname, size: 20.0, weight: FontWeight.w700),
          CircleAvatar(
            radius: 5,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
