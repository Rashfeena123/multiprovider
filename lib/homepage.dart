
import 'package:flutter/material.dart';
import 'package:multiprovider/cartmodel.dart';
import 'package:multiprovider/cartpage.dart';

import 'package:multiprovider/myuser.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
 
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: <Widget> [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.shopping_cart)),
              ),
            ],
          ),
          InkWell(
            onTap: (){
              
            },
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sign In",style: TextStyle(fontSize: 18),),
            )),
          )
        ],
      ),
      body: Container(
        margin:  EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 200,
              margin:  EdgeInsets.only(top: 10),
              color: Colors.teal[200],
              child: Center(
                child: Consumer<MyCart>(
                  builder:(context,myCart,child)=>Text(
               myCart.cartList.length.toString(),
                    style: TextStyle(fontSize: 40),
              ),
                ),
              ),
            ),
            
            Container(
              height: 250,
              margin: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                        },
                          child: Container(
                            width: 200,
                            height: 150,
                            child: Text(""),
                            color: Colors.teal[100],
                            margin: EdgeInsets.only(right: 10, top: 10),

                          ),
                      ),
                      Text("Product Name",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      SizedBox(height: 10,),
                     Consumer<MyCart>(
                       builder: (context,myCart,child)=>InkWell(
                            onTap: (){
                            myCart.addToCart(index);
                              },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.teal[300],
                              ),

                                height:45,
                                width: 130,
                                child: Center(
                                    child: Text(
                                        "Add to cart",
                                        style: TextStyle(color: Colors.white)))),
                          ),
                     ),


      ],
        ),
      ),
    ),
            Consumer<MyUser>(
              builder: (context,model,child) => Container(
                height:80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( model.isSignedIn? 'User has signed In':'User has signed out',style: TextStyle(fontSize: 23,color: Colors.white),),
                    ),
                    InkWell(
                        onTap: (){
                          model.changeStatus();
                        },
                        child: Text(model.isSignedIn?"Sign In":"Sign out"))
                  ],
                ),
              ),
            )
      ]),
    ),
    );
  }
}

