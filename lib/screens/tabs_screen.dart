import 'package:flutter/material.dart';
import 'package:meals_app_mobile/screens/category_screen.dart';
import 'package:meals_app_mobile/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  int activeScreenIndex = 0;

  selectedTabScreens(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    Widget activeScreenPage = const CatergoryScreen();

    if (activeScreenIndex == 1) {
      activePageTitle = 'Your Favorites';
      activeScreenPage = const MealsScreen(mealModel: []);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
