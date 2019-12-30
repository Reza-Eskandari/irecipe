import 'package:flutter/material.dart';
import 'package:irecipe2/models/meal.dart';
import 'package:irecipe2/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  int selectedPageIndex = 0;
  @override
  void initState() {
    pages = [
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': "Favorites",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selectedPageIndex]['title'],
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black,
          currentIndex: selectedPageIndex,
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text("Favourites"),
            ),
          ]),
    );
  }
}
