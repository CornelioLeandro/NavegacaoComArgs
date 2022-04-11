import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsBottonScreen extends StatefulWidget {
  @override
  State<TabsBottonScreen> createState() => _TabsBottonScreenState();
}

class _TabsBottonScreenState extends State<TabsBottonScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedScreenIndex]),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorito',
          ),
        ],
      ),
    );
  }
}
