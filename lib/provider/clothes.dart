import 'package:flutter/material.dart';
import '../util/database_ref.dart';

class Clothe with ChangeNotifier {
  final int id;
  //final List<String> items;
  final String name;
  final String imageurl;
  final String describe;
  final String price;
  bool isFav;

  Clothe({
    required this.id,
    //required this.items,
    required this.name,
    required this.imageurl,
    required this.describe,
    required this.price,
    this.isFav = false,
  });
}

class Clothes with ChangeNotifier {
  List<Clothe> get dummyClothes => [..._dummyClothes];

  List<Clothe> get favoriteClothes => [..._favoriteClothes];

  Clothe findById(int id) =>
      _dummyClothes.firstWhere((element) => element.id == id);

  Future<void> getData() async {
    List<Map<String, dynamic>> data =
        await database_ref!.rawQuery('select * from tasks');
    _dummyClothes.clear();
    data.forEach((element) {
      _dummyClothes.add(
        Clothe(
          id: element['id'],
          name: element['title'],
          describe: element['describe'],
          price: element['price'],
          imageurl: element['imageurl'],
        ),
      );
    });
  }

  Future<void> addClothe(
      String name, String imageurl, String describe, String price) async {
    await database_ref!.transaction((txn) async {
      int id = await txn.rawInsert(
          'insert into products (name, imageurl, describe,price) values ("$name", "$imageurl", "$describe", "$price")');
    });

    notifyListeners();
  }

  Future<void> updateClothe(int id, String name, String imageurl,
      String describe, String price) async {
    await database_ref!.rawUpdate(
      'UPDATE products SET name = "$name", imageurl = "$imageurl", describe = "$describe", price = "$price" WHERE id = $id',
    );
    notifyListeners();
  }

  Future<void> removeClothe(int id) async {
    await database_ref!.rawDelete('DELETE FROM products WHERE id = $id');

    notifyListeners();
  }

  final List<Clothe> _favoriteClothes = [];

  final List<Clothe> _dummyClothes = [
    Clothe(
        id: 1,
        //items: ['1'],
        name: 'T-Shirt',
        imageurl: 'https://m.media-amazon.com/images/I/61QZ72APrOL._UX569_.jpg',
        describe: 'Cotton',
        price: '10',
        isFav: false),
    Clothe(
      id: 2,
      // items: [
      //   '2',
      // ],
      name: 'Shirt',
      imageurl:
          'https://cdn.shopclues.com/images1/thumbnails/88017/640/1/138854428-88017481-1527669982.jpg',
      describe: 'Silk',
      price: '12',
      isFav: false,
    ),
  ];
}
