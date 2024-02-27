

import 'package:flutter/material.dart';

SnackBar showSnackBar(String text,BuildContext context,Color color){

  return SnackBar(
    content: Text(text),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        right: 20,
        left: 20),
  );

}