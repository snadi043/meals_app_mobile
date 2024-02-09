import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.mealsModel,
    required this.onToggleFavorite,
  });

  final MealsModel mealsModel;
  final void Function(MealsModel mealsModel) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsModel.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(mealsModel);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealsModel.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in mealsModel.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 14),
              ),
            const SizedBox(height: 16),
            Text('Steps',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
            const SizedBox(height: 14),
            for (final step in mealsModel.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 14,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
