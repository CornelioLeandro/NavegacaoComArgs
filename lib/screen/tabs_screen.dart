import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category),
                text: 'Categorias',),
              Tab(icon: Icon(Icons.star),
                text: 'Favorito',),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(),FavoriteScreen()],
        ),
      ),
    );
  }
}
