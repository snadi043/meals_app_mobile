import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_mobile/screens/category_screen.dart';
import 'package:meals_app_mobile/screens/filters_screen.dart';
import 'package:meals_app_mobile/screens/meals_screen.dart';
import 'package:meals_app_mobile/widgets/main_drawer.dart';
import 'package:meals_app_mobile/providers/meals_provider.dart';
import 'package:meals_app_mobile/providers/favorites_provider.dart';

import 'package:meals_app_mobile/providers/filter_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.onlyVegan: false,
  Filter.onlyVegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int activeScreenIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  selectedTabScreens(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealModel = ref.watch(mealProvider);
    final availableMeals = mealModel.where((mealModel) {
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
      availableMeals: availableMeals,
    );

    if (activeScreenIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePageTitle = 'Your Favorites';
      activeScreenPage = MealsScreen(
        mealModel: favoriteMeals,
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
