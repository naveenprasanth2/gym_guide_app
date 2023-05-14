import 'package:flutter/material.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "/exerciseListPage";
  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //the below line helps us in getting the data from another class with out passing in constructor
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(args)),
    );
  }
}
