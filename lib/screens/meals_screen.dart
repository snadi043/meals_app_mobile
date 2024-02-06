import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:meals_app_mobile/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.mealModel});

  final List<MealsModel> mealModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oh..Oh! Nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try meals from another category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (mealModel.isNotEmpty) {
      content = ListView.builder(
          itemCount: mealModel.length,
          itemBuilder: (ctx, index) => MealItem(mealsModel: mealModel[index]));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
