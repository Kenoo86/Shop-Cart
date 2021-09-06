import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/clothes.dart';
import 'package:shopping_cart/screen/add_screen.dart';

class ProductDetails extends StatelessWidget {
  final int id;
  const ProductDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clothe = Provider.of<Clothe>(context);
    return Column(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Image.network(
                clothe.imageurl,
              ),
            ),
            Text(
              clothe.name,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: 80,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddScreen.routeName, arguments: {
                  'id': id,
                });
              },
              icon: Icon(Icons.edit),
              color: Colors.red,
            ),
            IconButton(
                onPressed: () {
                  Provider.of<Clothes>(context, listen: false).removeClothe(id);
                },
                icon: Icon(Icons.delete),
                color: Colors.red),
          ],
        ),
      )
    ]);
  }
}
