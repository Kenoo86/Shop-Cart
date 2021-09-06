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
  final int id;
  final name, imageurl, price, describe;
  final bool isFav;

  const ClothesItems(
      this.id, this.name, this.imageurl, this.price, this.describe, this.isFav,
      {Key? key})
      : super(key: key);

  @override
  _ClothesItemsState createState() => _ClothesItemsState();
}

class _ClothesItemsState extends State<ClothesItems> {
  //late final String id;
  @override
  Widget build(BuildContext context) {


    //Clothe _clothe = Provider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(ClothesDetails.routeName, arguments: {
          'title': widget.name,
          'id': widget.id,
        }),
        child: Card(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 300,
                child: Image.network(
                 // _clothe.imageurl,
                  widget.imageurl,
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
                          // if (widget.isFav) {
                          //   Provider.of<Clothes>(context, listen: false)
                          //       .removeClothe(widget.id);
                          // } else {
                          //   Provider.of<Clothes>(context, listen: false)
                          //       .addClothe(widget.name, widget.describe,
                          //           widget.imageurl, widget.price);
                          // }
                          // setState(() {
                          //   // widget.isFav = !widget.isFav;
                          // });
                        },
                        icon: Icon(
                          //clothes.isFav ? Icons.favorite :
                          Icons.favorite_border,
                          color: Colors.orange,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      //_clothe.name,
                      widget.name,
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