import 'package:flutter/material.dart';
import 'package:meals_app_mobile/data/category_data.dart';
import 'package:meals_app_mobile/screens/meals.dart';
import 'package:meals_app_mobile/widgets/category_list.dart';

class Catergory extends StatelessWidget {
  const Catergory({super.key});

  void _selectedCategory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const Meals(mealModel: [], title: 'Some Catergory');
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your Category')),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          //for loop is alternate version of using map()
          //i.e dummyMealData.map((categoryList) => {CategoryList(categoryModel: categoryList)};)
          for (final categorylist in dummyMealData)
            CategoryList(
              categoryModel: categorylist,
              onSelectedCategory: () {
                _selectedCategory(context);
              },
            ),
        ],
      ),
    );
  }
}
