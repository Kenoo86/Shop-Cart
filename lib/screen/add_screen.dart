import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/clothes.dart';

class AddScreen extends StatefulWidget {
  static const routeName = ('AddScreen');

  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool _isFirst = true;
  var arg;
  Clothe? product;
  var _titleController = TextEditingController();
  var _priceController = TextEditingController();
  var _description = TextEditingController();
  var _imageurl = TextEditingController();

  @override
  void didChangeDependencies() {
    if (_isFirst) {
      arg = ModalRoute.of(context)!.settings.arguments;
      print(arg);
      if (arg != null) {
        product =
            Provider.of<Clothes>(context, listen: false).findById(arg['id']);
        _titleController.text = product!.name;
        _priceController.text = product!.price;
        _description.text = product!.describe;
        _imageurl.text = product!.imageurl;
      }
      _isFirst = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product == null ? 'Add Screen' : 'Edit Screen'),
        //Text('Add Screen'),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0,primary: Theme.of(context).primaryColor),
              onPressed: () {
                arg == null
                    ? Provider.of<Clothes>(context, listen: false).addClothe(
                        _titleController.text,
                        _imageurl.text,
                        _priceController.text,
                        _description.text,
                      )
                    : Provider.of<Clothes>(context, listen: false).updateClothe(
                        arg['id'],
                        _titleController.text,
                        _imageurl.text,
                        _description.text,
                        _priceController.text,
                      );
                Navigator.pop(context);
              },
              child: Icon(Icons.save,color: Colors.white,),
            ),
          ),
          //Icon(Icons.save),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
          ),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: _imageurl,
                decoration: InputDecoration(
                  labelText: 'ImageUrl',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// //widget
// import '../widget/add_item.dart';

// class AddScreen extends StatelessWidget {
//   static const routeName = ('AddScreen');
//   const AddScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Add Screen'),
//           actions: [
//             Padding(
//               padding: const EdgeInsetsDirectional.only(end: 10),
//               child: Icon(Icons.save),
//             ),
//           ],
//         ),
//         body: AddItem()
//         // ListView.builder(
//         //   itemCount: clothes.length,
//         //   itemBuilder: (_, i) => ChangeNotifierProvider.value(
//         //     value: clothes[i],
//         //     child: AddItem(),
//         //   ),
//         // ),
//         );
//   }
// }