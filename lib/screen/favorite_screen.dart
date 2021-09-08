import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//provider
import '../provider/clothes.dart';
//widget
import 'package:shopping_cart/widget/clothes_item.dart';


class FavoriteClothes extends StatelessWidget {
  static const routeName = ('FavoriteClothes');
  const FavoriteClothes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Clothes>(context).favoriteClothes;
    return Scaffold(
      body: GridView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ClothesItems(),
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
      ),
    );
  }
}