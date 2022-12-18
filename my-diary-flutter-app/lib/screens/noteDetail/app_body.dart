import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/model/diary.dart';
import 'package:my_diary/utils/utility.dart';

Widget buildBody(context, Diary note) {
    String baseUrl = 'http://127.0.0.1';

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      baseUrl = 'http://10.0.2.2';
    }
  }
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getHmaFromDate(note.date),
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: GrayColor.color10,
              height: 2.0,
            ),
          ),
          Text(
            note.title,
            style: const TextStyle(
              color: GrayColor.color30,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          Text(
            note.des,
            style: const TextStyle(
              color: GrayColor.color30,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
          Column(
            children: <Widget>[
              for (var image in note.image)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Image.network(
                    'https://sheikhsoft.fly.dev/api/files/diary/${note.id}/$image',
                    height: 180.0,
                    width: 180.0,
                    fit: BoxFit.fill,
                  ),
                )
            ],
          ),
        ],
      ),
    ),
  );
}
