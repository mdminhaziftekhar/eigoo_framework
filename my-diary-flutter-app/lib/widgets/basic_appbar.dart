import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'back_button.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: (MediaQuery.of(context).viewPadding.top + 10).roundToDouble(),
          bottom: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BackArrowButton(
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: GrayColor.color10,
              ),
            ),
            const SizedBox(width: 45)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(106);
}
