import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//provider
import 'package:shopping_cart/provider/clothes.dart';

//fonts
import 'package:google_fonts/google_fonts.dart';
//screens
import '../screen/clothes_details.dart';
import '../screen/tab_screen.dart';

class ClothesItems extends StatefulWidget {

  const ClothesItems(
      {Key? key})
      : super(key: key);

  @override
  _ClothesItemsState createState() => _ClothesItemsState();
}

class _ClothesItemsState extends State<ClothesItems> {
  //late final String id;
  @override
  Widget build(BuildContext context) {
    final clothe = Provider.of<Clothe>(context);


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(ClothesDetails.routeName, arguments: {
          'title': clothe.name,
          'id': clothe.id,
        }),
        child: Card(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 300,
                child: Image.network(
                 // _clothe.imageurl,
                  clothe.imageurl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black87,
                width: 180,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (clothe.isFav) {
                            Provider.of<Clothes>(context, listen: false)
                                .removeFavorite(clothe.id);
                          } else {
                            Provider.of<Clothes>(context, listen: false)
                                .addFavorite(clothe.id
                            );
                          }
                          setState(() {
                            clothe.isFav = !clothe.isFav;
                            print(clothe.isFav);
                          });
                        },
                        icon: Icon(
                          clothe.isFav ? Icons.favorite :
                          Icons.favorite_border,
                          color: Colors.orange,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      //_clothe.name,
                      clothe.name,
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.orange,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}