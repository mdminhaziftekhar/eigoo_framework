import 'package:codeview/codeview.dart';
import 'package:flutter/material.dart';
import 'package:my_diary/widgets/basic_appbar.dart';

class AnsQuestionOneScreen extends StatefulWidget {
  const AnsQuestionOneScreen({super.key});

  @override
  State<AnsQuestionOneScreen> createState() => _AnsQuestionOneScreen();
}

class _AnsQuestionOneScreen extends State<AnsQuestionOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Ans Question One'),
      body: _buildBody(),
    );
  }

  List<String> arr = [
    '<a href="/index.cfm?module=dispatch&amp;intLoadId=228800" target="_blank"> 228800 </a>',
    '<a href="/index.cfm?module=dispatch&amp;intLoadId=224411" target="_blank"> 224411 </a>',
    '<a href="/index.cfm?module=dispatch&amp;intLoadId=220033" target="_blank"> 220033 </a>'
  ];

  String getStringFromList(List<String> ListData) {
    String result = '';
    for (var i = 0; i < ListData.length; i++) {
      String item = ListData[i];
      String value = item.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
      result = result + '$value ,';
    }
    return result;
  }

  Widget _buildBody() {
    final _theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: CodeView(
            code: """
String getStringFromList(List<String> ListData) {
    String result = '';
    for (var i = 0; i < ListData.length; i++) {
      String item = ListData[i];
      String value = item.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
      result = result + "\$value ,";
    }
    return result;
  }
""",
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            title: 'Nessery Function',
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text('Ans' + getStringFromList(arr), style: _theme.textTheme.headline6)
      ],
    );
  }
}
