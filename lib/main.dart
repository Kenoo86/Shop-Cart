import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//utilies
import './util/database_ref.dart';
//providers
import './provider/clothes.dart';
//screens
import 'package:shopping_cart/screen/clothes_screen.dart';
import 'package:shopping_cart/screen/clothes_details.dart';
import './screen/tab_screen.dart';
import './screen/product_screen.dart';
import './screen/favorite_screen.dart';
import './screen/waiting_screen.dart';
import './screen/add_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Clothes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: openDb(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return TabScreen();
            }
            return WaitingScreen();
          },
        ),
        title: ('Shopping App'),
        theme: ThemeData(
            primaryColor: Colors.purpleAccent, accentColor: Colors.purple),
        routes: {
          ClothesDetails.routeName: (_) => ClothesDetails(),
          ShoppingScreen.routeName: (_) => ShoppingScreen(),
          YourProduct.routeName: (_) => YourProduct(),
          FavoriteClothes.routeName: (_) => FavoriteClothes(),
          AddScreen.routeName: (_) => AddScreen(),
        },
      ),
    );
  }
}
