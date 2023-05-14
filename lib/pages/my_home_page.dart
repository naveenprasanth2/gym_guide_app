import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/workout_category_list.dart';
import 'package:gym_guide_app/widgets/workout_category_widget.dart';

class MyHomePage extends StatelessWidget {
  static String routeName = "/myHomePage";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text(
            "Welcome Naveen",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/user_image.png"),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "WorkOut Categories",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    fontStyle: FontStyle.italic),
              ),
              const Divider(
                color: Colors.black,
              ),
              //the below line helps in sending a list of widgets into column ... operator does for us
              // ...workoutCategoryList
              //     .map((e) => WorkoutCategoryWidget(workoutCategoryModel: e))
              //     .toList(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                  itemBuilder: (context, index) => WorkoutCategoryWidget(
                      workoutCategoryModel: workoutCategoryList[index]),
                  itemCount: workoutCategoryList.length,
                ),
              )
            ],
          ),
        ));
  }
}
