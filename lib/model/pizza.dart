import 'package:equatable/equatable.dart';

class Pizza {
  int? id;
  final String name;
  final String imageSrc;
  final int price;
  final List<int> toppingList = [];

  Pizza({
    required this.name,
    required this.imageSrc,
    required this.price,
  }) {
    id = _increment();
  }

  static int _num = 1;
  static int _increment() {
    return _num++;
  }
}

class SizePizza {
  int? id;
  final String name;
  final int price;

  SizePizza({
    required this.name,
    required this.price,
  }) {
    id = _increment();
  }

  static int _num = 1;
  static int _increment() {
    return _num++;
  }
}

class Topping extends Equatable {
  int? id;
  final String name;
  final int price;
  bool checked = false;

  Topping({
    required this.name,
    required this.price,
  }) {
    id = _increment();
  }

  static int _num = 1;
  static int _increment() {
    return _num++;
  }

  @override
  List<Object?> get props => [name, price, checked];

  @override
  bool get stringify => true;
}
