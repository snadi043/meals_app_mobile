import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(
      {super.key,
      required this.categoryModel,
      required this.onSelectedCategory});

  final CategoryModel categoryModel;
  final Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                categoryModel.color.withOpacity(0.55),
                categoryModel.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
