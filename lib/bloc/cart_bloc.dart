import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType { add, remove }

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc {
  final itemList = [
    Item("맥북", 20000),
    Item("맥북2", 20000),
    Item("맥북3", 20000),
    Item("맥북4", 20000),
  ];
  final _cartList = List<Item>();

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    switch (event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}
