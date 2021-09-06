import 'package:flutter/material.dart';
import '../screen/product_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 50,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(
              thickness: 1.5,
              height: 0,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(children: [
                Icon(
                  Icons.shop,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Shop',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(
              thickness: 1.5,
              height: 0,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Row(children: [
                Icon(
                  Icons.credit_card,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Order',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(
              thickness: 1.5,
              height: 0,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(YourProduct.routeName);
              },
              child: Row(children: [
                Icon(
                  Icons.edit,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Manage Products',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(
              thickness: 1.5,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
