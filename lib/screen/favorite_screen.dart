import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//provider
import 'package:shopping_cart/provider/clothes.dart';
//widget
import 'package:shopping_cart/widget/clothes_item.dart';

class FavoriteClothes extends StatelessWidget {
  static const routeName = ('FavoriteClothes');
  const FavoriteClothes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Clothes>(context).favoriteClothes;
    return Scaffold(
      // appBar: AppBar(
      //     title: Text('Favorite Items'),
      //     ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ClothesItems(
            products[i].id,
            products[i].name,
            products[i].imageurl,
            products[i].price,
            products[i].describe,
            products[i].isFav,
          ),
        ),
      ),
    );
  }
}
