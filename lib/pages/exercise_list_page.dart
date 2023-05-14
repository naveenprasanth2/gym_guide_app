import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/exercise.dart';
import 'package:gym_guide_app/model/exercise_model.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "/exerciseListPage";

  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ExerciseModel exerciseModel = exerciseList[0];
    //the below line helps us in getting the data from another class with out passing in constructor
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;

    final String title = args["title"].toString();
    final List<ExerciseModel> listOfExercise = args["listOfExercise"];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 4,
                color: Colors.grey.withOpacity(0.1),
              )
            ],
              borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                  child: Image.network(exerciseModel.imageUrl)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  // space between makes the values to seperate from each other in a row
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      exerciseModel.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(
                          5,
                          (index) => Icon(
                                index < exerciseModel.difficulty
                                    ? Icons.star
                                    : Icons.star_outline,
                                size: 15,
                                color: Colors.orange,
                              )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Equipment: ${exerciseModel.equipment.join(", ")}",
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
