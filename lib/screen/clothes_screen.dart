import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//models
//import '../models/items.dart';
//widget
import '../widget/clothes_item.dart';
//provider
import '../provider/clothes.dart';

class ShoppingScreen extends StatelessWidget {
  static const routeName = ('ShoppingScreen');
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clothes = Provider.of<Clothes>(context).dummyClothes.toList();

    return Scaffold(
      body: GridView.builder(
        itemCount: clothes.length,
        itemBuilder: (_, i) => ClothesItems(
            clothes[i].id,
            clothes[i].name,
            clothes[i].imageurl,
            clothes[i].price,
            clothes[i].describe,
            clothes[i].isFav),
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
