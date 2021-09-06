import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//provider
import 'package:shopping_cart/provider/clothes.dart';
//widget
import 'package:shopping_cart/widget/clothes_item_details.dart';

class ClothesDetails extends StatelessWidget {
  static const routeName = ('ClothesDetails');
  const ClothesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final clothes = Provider.of<Clothes>(context)
        .dummyClothes
        .where(
          (element) => element.id == arg['id'],
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('${arg['title']}')),
      body: ListView.builder(
          itemCount: clothes.length,
          itemBuilder: (_, i) => ChangeNotifierProvider.value(
                value: clothes[i],
                child: ClothesItemDetails(),
              )),
    );
  }
}