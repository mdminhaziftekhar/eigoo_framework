import 'package:flutter/material.dart';

final List<String> months = <String>[
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

String formattedDateTime(date) {
  return "${date.day} ${months[date.month - 1]} ${date.year}";
}

String getHmaFromDate(date) {
  return "${(date.hour > 12 ? date.hour - 12 : date.hour).abs()}:${(date.minute < 10 ? "0${date.minute}" : date.minute)} ${date.hour >= 12 ? "PM" : "AM"}";
}

String getMoodEmoji(String type) {
  switch (type) {
    case "happy":
      return "assets/images/happy.png";
    case "sad":
      return "assets/images/sad.png";
    case "angry":
      return "assets/images/angry.png";
    case "neutral":
      return "assets/images/neutral.png";
    case "laughing":
      return "assets/images/laughing.png";
    default:
      return "assets/images/happy.png";
  }
}

Route navigateRoute(context, page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

String getHmaFromTime(TimeOfDay time) {
  return "${(time.hour > 12 ? time.hour - 12 : time.hour).abs()}:${(time.minute < 10 ? "0${time.minute}" : time.minute)} ${time.hour >= 12 ? "PM" : "AM"}";
}
