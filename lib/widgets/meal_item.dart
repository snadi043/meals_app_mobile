import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:meals_app_mobile/widgets/meal_traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealsModel});
  final MealsModel mealsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(8),
      elevation: 2.5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(mealsModel.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Column(children: [
                Text(
                  mealsModel.title,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealTraits(
                      icon: Icons.schedule,
                      label: '${mealsModel.duration} min',
                    ),
                    const SizedBox(width: 12),
                    MealTraits(
                      icon: Icons.work,
                      label: mealsModel.complexity.name[0].toUpperCase() +
                          mealsModel.complexity.name.substring(1),
                    ),
                    const SizedBox(width: 12),
                    MealTraits(
                      icon: Icons.monetization_on_rounded,
                      label: mealsModel.affordability.name[0].toUpperCase() +
                          mealsModel.affordability.name.substring(1),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
