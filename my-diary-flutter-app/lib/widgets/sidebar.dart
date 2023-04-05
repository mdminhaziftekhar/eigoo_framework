import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/screens/ans_one/ans_one_screen.dart';
import 'package:my_diary/screens/ans_two/ans_two_screen.dart';
import 'package:my_diary/utils/utility.dart';

import '../provider.dart';
import 'buttons.dart';

class Sidebar extends ConsumerWidget {
   Sidebar({super.key});

  final phoneNumberProvider = Provider.autoDispose<String>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.formattedPhoneNumber;
});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumber = ref.watch(phoneNumberProvider);
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           Padding(
            padding: EdgeInsets.only(top: 75.0, left: 14.0, bottom: 40),
            child: Text(
              phoneNumber,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: GrayColor.color10)),
          ),
          ListItem(
            title: "Ans Question One",
            icon: Icons.question_answer,
            onPressed: () => {
              Navigator.of(context).push(
                navigateRoute(
                  context,
                  const AnsQuestionOneScreen(),
                ),
              )
            },
          ),
          ListItem(
            title: "Ans Question Two",
            icon: Icons.question_answer,
            onPressed: () => {
               Navigator.of(context).push(
                navigateRoute(
                  context,
                  const AnswerTwoScreen(),
                ),
              )
            },
          ),

          Spacer(),
          
          SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  title: "Sign out",
                  onPressed: () {
                    final authService = ref.read(authServiceProvider);
                    authService.signOut();
                  }),
            ),
          
          
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      minLeadingWidth: 0,
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: GrayColor.color10)),
      leading: Icon(
        icon,
        size: 26,
        color: GrayColor.color10,
      ),
      onTap: onPressed,
    );
  }
}
