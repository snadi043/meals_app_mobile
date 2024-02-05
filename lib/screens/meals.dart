import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.mealModel});

  final List<MealsModel> mealModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body:
    );
  }
}
