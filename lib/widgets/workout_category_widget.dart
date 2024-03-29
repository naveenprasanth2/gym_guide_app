import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/exercise.dart';
import 'package:gym_guide_app/model/workout_category_model.dart';
import 'package:gym_guide_app/pages/exercise_list_page.dart';

class WorkoutCategoryWidget extends StatelessWidget {
  final WorkoutCategoryModel workoutCategoryModel;

  const WorkoutCategoryWidget({Key? key, required this.workoutCategoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            //the below line helps in sending the arguments without constructor
            Navigator.of(context)
                .pushNamed(ExerciseListPage.routeName, arguments: {
              "title": workoutCategoryModel.categoryName,
              "listOfExercise": exerciseList
                  .where((element) =>
                      element.category == workoutCategoryModel.categoryName)
                  .toList()
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              child: Stack(
                children: [
                  Image.network(
                    workoutCategoryModel.imageSource,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 400,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent])),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            workoutCategoryModel.categoryName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
