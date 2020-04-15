import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercartbloc/bloc/cart_bloc.dart';
import 'package:fluttercartbloc/bloc/cart_provider.dart';
import 'package:fluttercartbloc/main.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder(
        stream: cartBloc.cartList,
        builder: (context, snaphot) {
          var sum = 0;
          if (snaphot.data.length > 0) {
            sum = snaphot.data
                .map((item) => item.price)
                .reduce((acc, e) => acc + e);
          }
          return Center(
            child: Text(
              '합계 : $sum',
              style: TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );
  }
}
