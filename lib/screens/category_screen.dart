import 'package:flutter/material.dart';
import 'package:meals_app_mobile/data/category_data.dart';
import 'package:meals_app_mobile/model/category_model.dart';
import 'package:meals_app_mobile/screens/meals_screen.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:meals_app_mobile/widgets/category_list.dart';

class CatergoryScreen extends StatelessWidget {
  const CatergoryScreen({super.key, required this.availableMeals});
  final List<MealsModel> availableMeals;

  void _selectedCategory(BuildContext context, CategoryModel categoryModel) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryModel.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return MealsScreen(
          mealModel: filteredMeals,
          title: categoryModel.title,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        //for loop is alternate version of using map()
        //i.e dummyMealData.map((categoryList) => {CategoryList(categoryModel: categoryList)};)
        for (final category in dummyMealData)
          CategoryList(
            categoryModel: category,
            onSelectedCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
