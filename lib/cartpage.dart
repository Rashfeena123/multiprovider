
import 'package:flutter/material.dart';
import 'package:multiprovider/cartmodel.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key,}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer<MyCart>(
        builder: (context,myCart,child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(myCart.cartList.length.toString()),
            InkWell(
              onTap: (){
                myCart.removeAtLastFromCart();
              },
              child: Text("Delete one element"),
            )
          ],
        ),
      )),

    );
  }
}
