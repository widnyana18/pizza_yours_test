import 'package:pizza_yours_test/model/pizza.dart';

class Orders {
  final Pizza pizza;
  final List<Topping> toppings;

  Orders({
    required this.pizza,
    required this.toppings,
  });
}
