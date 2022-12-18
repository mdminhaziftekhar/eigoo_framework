import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/model/diary.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/back_button.dart';

buildAppBar(context, Diary note) {
  return PreferredSize(
    preferredSize: const Size(0, 96),
    child: Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: (MediaQuery.of(context).viewPadding.top + 14).roundToDouble(),
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BackArrowButton(
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDateTime(note.date),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: GrayColor.color10,
                ),
              )
            ],
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: GrayColor.color10,
              size: 28.0,
            ),
            splashRadius: 28,
            position: PopupMenuPosition.under,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: "Edit",
                child: Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: GrayColor.color10,
                      size: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                      ),
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: GrayColor.color10,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "Delete",
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete,
                      color: GrayColor.color10,
                      size: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                      ),
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        color: GrayColor.color10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
