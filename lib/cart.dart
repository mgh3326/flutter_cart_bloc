import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercartbloc/bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final _carBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        bloc: _carBloc,
        child: BlocBuilder(
          bloc: _carBloc,
          builder: (BuildContext context, List state) {
            var sum = 0;
            if (state.length > 0) {
              sum = state
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
      ),
    );
  }
}
