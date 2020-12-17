import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppState extends ChangeNotifier {
  //Colors
  Color getColor(String theColor) {
    if (theColor != null) {
      theColor = theColor.toLowerCase();
    } else {
      theColor = "white";
    }
    if (theColor.contains("green")) {
      return Colors.green;
    } else if (theColor.contains("red")) {
      return Colors.red;
    } else if (theColor.contains("purple")) {
      return Colors.purple;
    } else if (theColor.contains("pink")) {
      return Colors.pink;
    } else if (theColor.contains("black")) {
      return Colors.black;
    } else if (theColor.contains("white")) {
      return Colors.white;
    } else if (theColor.contains("yellow")) {
      return Colors.yellow;
    } else if (theColor.contains("grey")) {
      return Colors.grey;
    } else if (theColor.contains("maroon")) {
      return Colors.redAccent;
    } else if (theColor.contains("lilac")) {
      return Colors.pinkAccent;
    } else if (theColor.contains("gold")) {
      return Colors.yellow[900];
    } else if (theColor.contains("brown")) {
      return Colors.brown;
    } else if (theColor.contains("cream")) {
      return Colors.white70;
    } else if (theColor.contains("orange")) {
      return Colors.orange;
    } else if (theColor.contains("gray")) {
      return Colors.grey;
    } else if (theColor.contains("silver")) {
      return Colors.grey[200];
    } else if (theColor.contains("lime")) {
      return Colors.green[200];
    } else if ((theColor.contains("navy") && theColor.contains("blue") ||
        theColor.contains("navy"))) {
      return Colors.blue[400];
    } else if (theColor.contains("blue")) {
      return Colors.blue;
    } else if (theColor.contains("peach")) {
      return Colors.brown[700];
    } else if (theColor.contains("plum")) {
      return Colors.pink[400];
    } else {
      return Colors.grey.shade800;
    }
  }

  //Show Toast
  showToast(String text, {String color, bool long}) {
    Fluttertoast.showToast(
        backgroundColor: Colors.grey[800],
        textColor: color == null ? Colors.white : getColor(color),
        msg: text,
        toastLength: long == null ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG);
  }

    showSnackBar({BuildContext context,String message,String label,Function onPress,Duration time,Widget content}){
     final snackBar = SnackBar(
        content:content != null ? content:Text(message),
        duration: time != null ? time : Duration(seconds: 5),
        action: SnackBarAction(
          label: label,
          onPressed: onPress,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool dark = false;
}
