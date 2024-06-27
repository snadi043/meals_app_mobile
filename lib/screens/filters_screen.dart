import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_mobile/providers/filter_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var isGluttenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    isGluttenFree = widget.currentFilters[Filter.glutenFree]!;
    isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    isVegetarian = widget.currentFilters[Filter.onlyVegetarian]!;
    isVegan = widget.currentFilters[Filter.onlyVegan]!;
  }

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
