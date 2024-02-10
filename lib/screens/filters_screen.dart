import 'package:flutter/material.dart';
// import 'package:meals_app_mobile/screens/tabs_screen.dart';
// import 'package:meals_app_mobile/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  onlyVegan,
  onlyVegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  var isGluttenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  void onSelectChange(isChecked) {
    setState(() {
      isChecked(isGluttenFree);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(
      //   screenSelect: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: Text(
          'Set Filters',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool dipPop) {
          if (dipPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: isGluttenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.onlyVegetarian: isVegetarian,
            Filter.onlyVegan: isVegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 26),
              value: isGluttenFree,
              onChanged: onSelectChange,
              title: Text('Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text(
                'Only Gluten-free items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 26),
              value: isLactoseFree,
              onChanged: onSelectChange,
              title: Text('Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text(
                'Only Lactose-free items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 26),
              value: isVegan,
              onChanged: onSelectChange,
              title: Text('Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text(
                'Only Vegan items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 26),
              value: isVegetarian,
              onChanged: onSelectChange,
              title: Text('Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text(
                'Only vegetarian items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
