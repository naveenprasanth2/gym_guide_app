import 'package:flutter/material.dart';
import 'package:gym_guide_app/pages/exercise_detail_page.dart';
import 'package:gym_guide_app/pages/exercise_list_page.dart';

import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF322751)), //sets app bar theme globally
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName : (context) => const MyHomePage(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        ExerciseDetailPage.routeName: (context) => const ExerciseDetailPage(),
      },
    );
  }
}
