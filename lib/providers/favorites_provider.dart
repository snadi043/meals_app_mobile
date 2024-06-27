import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_mobile/model/meal_model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealsModel>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(MealsModel meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealsModel>>((ref) {
  return FavoriteMealsNotifier();
});
