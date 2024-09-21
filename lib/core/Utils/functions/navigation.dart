import 'package:flutter/material.dart';

pushReplacement(BuildContext context, Widget View) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => View));
}

push(BuildContext context, Widget View) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => View));
}
