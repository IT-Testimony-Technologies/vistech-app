import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<String> productImages = [
    'https://pbs.twimg.com/media/FmO5gkKWIAEIs8n?format=jpg&name=large',
    'https://pbs.twimg.com/media/FmLI-AqXoAAGD8W?format=jpg&name=large',
    'https://pbs.twimg.com/media/FmpnDxLWIAAZKTk?format=jpg&name=small',
    'https://pbs.twimg.com/media/FlvVZ64XwAAOjNk?format=jpg&name=medium',
    'https://pbs.twimg.com/media/FmSI5wHXoAAxbL6?format=png&name=900x900',
    'https://pbs.twimg.com/media/FP_O1nSXEAg2r0y?format=jpg&name=large',
    'https://pbs.twimg.com/media/FkMWO9yaUAASVjz?format=jpg&name=medium',
    'https://pbs.twimg.com/media/FkhL0qjWAAIkUk6?format=jpg&name=medium',
    'https://pbs.twimg.com/media/FmqivBEXEAAN15T?format=jpg&name=medium',
    'https://pbs.twimg.com/media/Fmd_DXZagAAA5ZA?format=jpg&name=medium',
  ];
  List<String> productNames = [
    "Piano",
    "Guitar",
    "Electric guitar",
    "Red Electric Guitar",
    "Blacked out Electric Guitar",
    "Violin",
    "Vlogger Microphone",
    "Studio Mic",
    "Tuner Drums",
    "Bass Drums"
  ];
  List<double> productPrices = [
    349.99,
    799.99,
    499.99,
    129.99,
    399.99,
    499.99,
    39.99,
    29.99,
    19.99,
    999.99
  ];

  void _addToCart(
      String productImage, String productName, double productPrice) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartScreen(
                productImage: productImage,
                productName: productName,
                productPrice: productPrice)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: productImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 10),
                                Image.network(
                                  productImages[index],
                                ),
                                SizedBox(height: 10),
                                Text(productNames[index]),
                                Text(
                                  '\$${productPrices[index]}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                    _addToCart(
                                        productImages[index],
                                        productNames[index],
                                        productPrices[index]);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blueAccent)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Buy",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.add_shopping_cart,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final String productImage;
  final String productName;
  final double productPrice;
  const CartScreen(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice})
      : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  late String _location;
  bool _isValid = true;
  void paypremium() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.0,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                top: 10.0,
              ),
              title: Text(
                "Confirm your payment",
                style: TextStyle(fontSize: 14.0),
              ),
              content: Container(
                height: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              // fixedSize: Size(250, 50),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Continue to PayPal"),
                                Icon(Icons.paypal_sharp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.productImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.productName,
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '\$ ${widget.productPrice.toString()}',
                        style: TextStyle(fontSize: 22.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Location Form
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Enter location'),
                      controller: _textController,
                    ),
                  ),
                ),
                // Buy button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      paypremium();
                    },
                    child: Container(
                      color: Colors.blueAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              //_messages.add(_textController.text);
                              paypremium();
                            },
                            child: Text(
                              'Buy',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
