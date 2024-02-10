import 'package:flutter/material.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:meals_app_mobile/screens/category_screen.dart';
import 'package:meals_app_mobile/screens/meals_screen.dart';
import 'package:meals_app_mobile/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  int activeScreenIndex = 0;
  final List<MealsModel> favoriteMeals = [];
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteMealsStatus(MealsModel mealsModel) {
    if (favoriteMeals.contains(mealsModel)) {
      setState(() {
        favoriteMeals.remove(mealsModel);
        _showInfoMessage("No longer a favorite meal");
      });
    } else {
      setState(() {
        favoriteMeals.add(mealsModel);
        _showInfoMessage("Added to favorite meal");
      });
    }
  }

  selectedTabScreens(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    Widget activeScreenPage =
        CatergoryScreen(toggleFavorite: _toggleFavoriteMealsStatus);

    if (activeScreenIndex == 1) {
      activePageTitle = 'Your Favorites';
      activeScreenPage = MealsScreen(
        mealModel: favoriteMeals,
        toggleFavorite: _toggleFavoriteMealsStatus,
      );
    }

    onSelectScreen(String identifier) {
      if (identifier == 'filter') {
      } else {
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(screenSelect: onSelectScreen),
      body: activeScreenPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedTabScreens,
        currentIndex: activeScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
