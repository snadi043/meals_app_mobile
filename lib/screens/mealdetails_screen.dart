import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_mobile/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.mealsModel,
  });

  final MealsModel mealsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(mealsModel);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealsModel.title),
        actions: [
          IconButton(
            onPressed: () {
              final bool wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(mealsModel);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added to favorite'
                      : 'Meal removed from favorite')));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 30),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                    child: child);
              },
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(isFavorite)),
            ),
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
