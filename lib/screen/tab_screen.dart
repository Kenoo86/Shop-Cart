import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/clothes.dart';

//screens
import '../screen/clothes_screen.dart';
import '../screen/favorite_screen.dart';

//widget
import '../widget/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Main',
        'page': ShoppingScreen(),
      },
      {
        'title': 'Favorite Clothes',
        'page': FavoriteClothes(),
      }
    ];
    super.initState();
  }

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_currentIndex]['title']), actions: [
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                )),
            CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10.0,
                child: Text(
                  '0',
                )),
          ],
        ),
      ]),
      drawer: DrawerWidget(),
      body: FutureBuilder(
        future: Provider.of<Clothes>(context).getData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return _pages[_currentIndex]['page'];
        },
      ),
      //_pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}