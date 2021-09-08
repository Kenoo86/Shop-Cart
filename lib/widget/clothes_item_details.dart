import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import '../provider/clothes.dart';

class ClothesItemDetails extends StatefulWidget {
  const ClothesItemDetails({Key? key}) : super(key: key);

  @override
  _ClothesItemDetailsState createState() => _ClothesItemDetailsState();
}

class _ClothesItemDetailsState extends State<ClothesItemDetails> {
  @override
  Widget build(BuildContext context) {
    final clothes = Provider.of<Clothe>(context);

    return Column(
      children: [
        Image.network(
          clothes.imageurl,
          width: double.infinity,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade500,
              ),
            ),
            Text(
              clothes.price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          clothes.describe,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}