// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:e_book_app/Helpers/common_widgets.dart';
import 'package:e_book_app/Helpers/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/shloka_model.dart';

Future<List<Shloka>> loadShlokas(String chapter) async {
  final String jsonString = await rootBundle.loadString('assets/shlokas.json');
  final Map<String, dynamic> jsonData = jsonDecode(jsonString);
  List<dynamic> chapterShlokas = jsonData['hi'][chapter] ?? [];
  return chapterShlokas
      .map((shlokaJson) => Shloka.fromJson(shlokaJson))
      .toList();
}

class ShlokaList extends StatefulWidget {
  final String chapter;
  const ShlokaList({required this.chapter});

  @override
  _ShlokaListState createState() => _ShlokaListState();
}

class _ShlokaListState extends State<ShlokaList> {
  late Future<List<Shloka>> _shlokasFuture;

  @override
  void initState() {
    super.initState();
    _shlokasFuture = loadShlokas(widget.chapter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
            text: 'श्लोकास - अधयाय ${widget.chapter}',
            weight: FontWeight.w700,
            color: AppColors.primaryColor),
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.orangeColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: FutureBuilder<List<Shloka>>(
        future: _shlokasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('No data found'));

          final shlokas = snapshot.data!;
          return ListView.builder(
            itemCount: shlokas.length,
            itemBuilder: (context, index) {
              final shloka = shlokas[index];
              return ExpansionTile(
                title:
                    Text(shloka.num + ": " + shloka.shloka.split("\n").first),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shloka:\n" + shloka.shloka),
                        SizedBox(height: 8),
                        Text("Meaning:\n" + shloka.meaning),
                        SizedBox(height: 8),
                        Text("Synonyms:\n" + shloka.synonyms),
                        SizedBox(height: 8),
                        Text("Purport:\n" + shloka.purport),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
