import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/model/diary.dart';
import 'package:my_diary/screens/home/home_controller.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/back_button.dart';

class CreateNote extends ConsumerStatefulWidget {
  const CreateNote({super.key, this.data});

  final Diary? data;

  @override
  ConsumerState<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends ConsumerState<CreateNote> {
  final _titleEditingController = TextEditingController();
  final _noteEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String mood = "happy";
  bool isFavorite = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      final DateTime now = DateTime.now();
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(homeProvider);
    if (widget.data != null) {
      _titleEditingController.text = widget.data!.title;
      _noteEditingController.text = widget.data!.des;
      selectedDate = widget.data!.date;
    }
    return Scaffold(
      appBar: _buildAppBar(model),
      body: _buildBody(model),
    );
  }

  PreferredSize _buildAppBar(HomeController model) {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 20.0,
          top: (MediaQuery.of(context).viewPadding.top + 14).roundToDouble(),
          bottom: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BackArrowButton(
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () async {
                if (widget.data != null) {
                  await model.updateNote(
                      widget.data!.id,
                      _titleEditingController.text,
                      _noteEditingController.text,
                      selectedDate,
                      isFavorite);
                } else {
                  await model.createNote(_titleEditingController.text,
                      _noteEditingController.text, selectedDate, isFavorite);
                }

                Navigator.pop(context);
              },
              label: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: BlueColor.color10,
                fixedSize: const Size(116, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(HomeController model) {
    return Container(
      color: GrayColor.color40,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      formattedDateTime(selectedDate),
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: GrayColor.color10,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      getHmaFromDate(selectedDate),
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: GrayColor.color10,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: GrayColor.color10,
                    )
                  ],
                ),
              ),
              TextFormField(
                controller: _titleEditingController,
                cursorColor: GrayColor.color10,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue)),
                  filled: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                  labelText: "Note Title",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _noteEditingController,
                cursorColor: GrayColor.color10,
                minLines: 5,
                maxLines: 15,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    filled: true,
                    contentPadding:
                        EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                    labelText: "Note..."),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                onPressed: () async {
                  model.showImageAlert(context);
                },
                label: const Text(
                  "Upload Image",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: BlueColor.color10,
                  fixedSize: const Size(200, 40),
                ),
              ),
              const SizedBox(height: 16),
              model.image != null
                  ? kIsWeb
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              model.image!.path,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(model.image!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                        )
                  : Text(
                      "No Image Selected",
                      style: TextStyle(fontSize: 20),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
