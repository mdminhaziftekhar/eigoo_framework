import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onSearch});

  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: SizedBox(
          height: 65.0,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  color: Colors.white,
                  child: Center(
                    child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: onSearch,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.search,
                            size: 32,
                            color: GrayColor.color10,
                          ),
                          Padding(padding: EdgeInsets.only(right: 50))
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.white,
                  child: Center(
                    child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.calendar_today,
                            color: GrayColor.color10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
