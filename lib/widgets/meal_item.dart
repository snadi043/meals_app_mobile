import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealsModel});
  final MealsModel mealsModel;

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealsModel.imageUrl)),
        ]),
      ),
    );
  }
}
