import 'package:flutter/material.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/widgets/exercise_card_widget.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "/exerciseListPage";

  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //the below line helps us in getting the data from another class with out passing in constructor
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String title = args["title"];
    final List<ExerciseModel> listOfExercise = args["listOfExercise"];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 20,),
          itemBuilder: (context, index) {
            return ExerciseCardWidget(exerciseModel: listOfExercise[index]);
          },
          itemCount: listOfExercise.length,
        ),
      ),
    );
  }
}
