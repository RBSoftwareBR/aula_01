import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox();

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: false,onChanged: (b){},);
  }
}
