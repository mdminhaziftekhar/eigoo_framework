import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_diary/model/diary.dart';
import 'package:my_diary/provider.dart';
import 'package:my_diary/services/api_services.dart';
import 'package:pocketbase/pocketbase.dart';

final homeProvider = ChangeNotifierProvider.autoDispose<HomeController>((ref) {
  final authService = ref.watch(apiServiceProvider);
  return HomeController(apiService: authService)..init();
});

class HomeController extends ChangeNotifier {
  final ApiService apiService;
  HomeController({required this.apiService});
  bool isDesc = true;

  List<Diary> _diaryList = [];
  List<Diary> get diaryList => _diaryList;

  XFile? _imageFile;
  XFile? get image => _imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> init() async {
    _diaryList.clear();
    List<RecordModel> recordList = await apiService.getFullList(
        collectionIdOrName: 'diary', sort: isDesc ? '-date' : '+date');

    for (var i = 0; i < recordList.length; i++) {
      Map<String, dynamic> itemMap = {
        'id': recordList[i].id,
        ...recordList[i].data,
      };

      _diaryList.add(Diary.fromJson(itemMap));
    }

    notifyListeners();
  }

  Future<void> sort() async {
    isDesc = !isDesc;
    init();
  }

  Future<void> createNote(
      String title, String note, DateTime selectedDate, bool isFavorite) async {
    if (_imageFile != null) {
      String fileName = _imageFile!.path.split('/').last;
      await apiService.create(
        collectionIdOrName: 'diary',
        body: {
          "title": title,
          'des': note,
          'date': "$selectedDate",
        },
        files: [
        kIsWeb? http.MultipartFile.fromBytes("image", await _imageFile!.readAsBytes(),filename: fileName) :  await http.MultipartFile.fromPath("image", _imageFile!.path,
              filename: fileName)
        ],
      );
    } else {
      await apiService.create(collectionIdOrName: 'diary', body: {
        "title": title,
        'des': note,
        'date': "$selectedDate",
       
      });
    }

    await init();
  }

  Future<void> deleteNote(BuildContext context, String id) async {
    await showDeleteConformationDialog(context, () async {
      await apiService.delete(collectionIdOrName: 'diary', recordId: id);
      await init();
      Navigator.pop(context);
    });
  }

  Future<void> showDeleteConformationDialog(
      BuildContext context, Function()? onPressed,
      {bool barrierDismissible = true}) async {
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Delete'),
            content: Text("common.are_you_sure"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(116, 40),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(116, 40),
                  ),
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ]);
      },
    );
  }

  Future<void> updateNote(String id, String title, String note,
      DateTime selectedDate, bool isFavorite) async {
    RecordModel record = await apiService.update(
        collectionIdOrName: 'diary',
        recordId: id,
        body: {
          "title": title,
          'des': note,
          'date': "$selectedDate",
        
        });

    await init();
  }

  Future getImage(ImageSource media) async {
    var img = await imagePicker.pickImage(source: media);
    _imageFile = img;
    notifyListeners();
  }

  void showImageAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children:const [
                         Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children:const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
