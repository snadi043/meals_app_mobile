import 'package:flutter/material.dart';
import 'package:meals_app_mobile/data/category_data.dart';
import 'package:meals_app_mobile/model/meal_model.dart';
import 'package:meals_app_mobile/screens/category_screen.dart';
import 'package:meals_app_mobile/screens/filters_screen.dart';
import 'package:meals_app_mobile/screens/meals_screen.dart';
import 'package:meals_app_mobile/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.onlyVegan: false,
  Filter.onlyVegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  int activeScreenIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;
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
    final availableMeals = dummyMeals.where((mealModel) {
      if (_selectedFilters[Filter.glutenFree]! && !mealModel.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !mealModel.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.onlyVegan]! && !mealModel.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.onlyVegetarian]! && !mealModel.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    var activePageTitle = 'Categories';
    Widget activeScreenPage = CatergoryScreen(
      toggleFavorite: _toggleFavoriteMealsStatus,
      availableMeals: availableMeals,
    );

    if (activeScreenIndex == 1) {
      activePageTitle = 'Your Favorites';
      activeScreenPage = MealsScreen(
        mealModel: favoriteMeals,
        toggleFavorite: _toggleFavoriteMealsStatus,
      );
    }

    void onSelectScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == 'filters') {
        final result = await Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ));
        setState(() {
          _selectedFilters = result ?? kInitialFilters;
        });
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
