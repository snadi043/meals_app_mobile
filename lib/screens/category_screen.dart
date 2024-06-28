import 'package:flutter/material.dart';
import 'package:meals_app_mobile/data/category_data.dart';
import 'package:meals_app_mobile/model/category_model.dart';
import 'package:meals_app_mobile/screens/meals_screen.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:meals_app_mobile/widgets/category_list.dart';

class CatergoryScreen extends StatefulWidget {
  const CatergoryScreen({super.key, required this.availableMeals});
  final List<MealsModel> availableMeals;

  @override
  State<CatergoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CatergoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectedCategory(BuildContext context, CategoryModel categoryModel) {
    final filteredMeals = widget.availableMeals
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
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeIn,
            ),
          ),
          child: child),
    );
  }
}
