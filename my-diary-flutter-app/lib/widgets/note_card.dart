import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/model/diary.dart';
import 'package:my_diary/screens/createNote/create_note.dart';
import 'package:my_diary/screens/home/home_controller.dart';
import 'package:my_diary/utils/utility.dart';

class NoteCard extends ConsumerWidget {
  const NoteCard({super.key, required this.data, this.onPressed});

  final Diary data;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homeProvider);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 172.0,
        margin: const EdgeInsets.only(
          top: 6.0,
          bottom: 6.0,
          right: 15.0,
          left: 15.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: GrayColor.color20,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopSection(context, model),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getHmaFromDate(data.date),
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: GrayColor.color10,
                        height: 2.0,
                      ),
                    ),
                    Text(
                      data.title,
                      style: const TextStyle(
                        color: GrayColor.color30,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      data.des,
                      overflow: TextOverflow.fade,
                      maxLines: 4,
                      softWrap: true,
                      style: const TextStyle(
                        color: GrayColor.color30,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  _buildTopSection(BuildContext context, HomeController model) {
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   getMoodEmoji(data.favorite),
                  //   scale: 18,
                  // ),
                  // const SizedBox(width: 10),
                  Text(
                    formattedDateTime(data.date),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: GrayColor.color10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        PopupMenuButton(
            onSelected: (value) async {
              if (value == 'Edit') {
                Navigator.of(context).push(
                  navigateRoute(context, CreateNote(data: data)),
                );
              } else if (value == 'Delete') {
                await model.deleteNote(context, data.id);
              }
            },
            icon: const Icon(
              Icons.more_vert,
              color: GrayColor.color10,
            ),
            splashRadius: 20,
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
                ])
      ],
    );
  }
}
