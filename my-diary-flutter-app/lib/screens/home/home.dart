import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/screens/createNote/create_note.dart';
import 'package:my_diary/screens/noteDetail/note_detail.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/note_card.dart';
import 'package:my_diary/widgets/sidebar.dart';

import 'home_controller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final model = ref.watch(homeProvider);
    return Scaffold(
      key: _key,
      appBar: _buildAppBar(model),
      body: RefreshIndicator(
        onRefresh: () async => await model.init(),
        child: ListView.builder(
          itemCount: model.diaryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: NoteCard(
                data: model.diaryList[index],
                onPressed: () => {
                  Navigator.of(context).push(
                    navigateRoute(
                        context, NoteDetail(note: model.diaryList[index])),
                  )
                },
              ),
            );
          },
        ),
      ),
      drawer: const Sidebar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 65.0,
        height: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => {
              Navigator.of(context).push(
                navigateRoute(
                  context,
                  const CreateNote(),
                ),
              )
            },
            backgroundColor: BlueColor.color10,
            elevation: 0.0,
            splashColor: Colors.white10,
            focusElevation: 0.0,
            highlightElevation: 0.0,
            child: const Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar(HomeController model) {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: (MediaQuery.of(context).viewPadding.top + 18).roundToDouble(),
          bottom: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "My Diary",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: GrayColor.color10,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  child: const Icon(
                    Icons.sort,
                    size: 28,
                    color: GrayColor.color10,
                  ),
                  onTap: () async => await model.sort(),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  child: const Icon(
                    Icons.menu,
                    size: 28,
                    color: GrayColor.color10,
                  ),
                  onTap: () => _key.currentState!.openDrawer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
