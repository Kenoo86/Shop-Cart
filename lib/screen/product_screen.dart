import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//provider
import 'package:shopping_cart/provider/clothes.dart';
import 'package:shopping_cart/widget/product_item.dart';
//screen
import '../screen/add_screen.dart';

class YourProduct extends StatelessWidget {
  static const routeName = ('YourProduct');
  const YourProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Clothes>(context).dummyClothes.toList();
    //Clothe _product = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
              onPressed: () {
                //Navigator.of(context).pushNamed(AddScreen.routeName);
                Navigator.of(context).pushNamed(
                  AddScreen.routeName,
                  //arguments: {'id': Provider.of<Clothe>(context).id}
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductDetails(products[i].id),
        ),
      ),
    );
  }
}