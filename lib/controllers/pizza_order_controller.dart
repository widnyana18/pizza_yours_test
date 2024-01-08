import 'package:flutter/material.dart';
import 'package:pizza_yours_test/model/pizza.dart';
import 'package:pizza_yours_test/views/pizza_orders_page.dart';

class PizzaOrderController with ChangeNotifier {
  PizzaOrderController._sharedInstance();

  static final _shared = PizzaOrderController._sharedInstance();

  factory PizzaOrderController() => _shared;

  int? selectedPizzaId;
  int selectedSizeId = sizes[1].id!;
  int toppingsPrice = 0;
  int totalPrice = 0;

  Pizza get _selectedPizza {
    return pizzaList.singleWhere((pizza) => pizza.id == selectedPizzaId);
  }

  int get _selectedSizePrice {
    final selectedSize = sizes.singleWhere((size) => size.id == selectedSizeId);
    return selectedSize.price;
  }

  void handlePizzaRadio(int pizzaId) {
    selectedPizzaId = pizzaId;
    _showToppings();
    notifyListeners();
  }

  void handleSizeRadio(int sizeId) {
    selectedSizeId = sizeId;
    notifyListeners();
  }

  void handleToppingCheckbox({int? toppingId, bool newValue = false}) {
    List<int> selectedToppings = _selectedPizza.toppingList;
    int currectToppings = 0;
    for (var topping in toppings) {
      if (toppingId == topping.id) {
        topping.checked = newValue;
        selectedToppings.add(topping.id!);
        currectToppings += topping.price;
      }
    }
    toppingsPrice = currectToppings;
    notifyListeners();
  }

  void _showToppings() {
    int currectToppings = 0;
    List<int> selectedToppings = _selectedPizza.toppingList;

    for (var topping in toppings) {
      if (selectedToppings.contains(topping.id)) {
        topping.checked = true;
        currectToppings += topping.price;
      } else {
        topping.checked = false;
      }
    }
    toppingsPrice = currectToppings;
    notifyListeners();
  }

  void calculatePrice() {
    totalPrice = _selectedPizza.price + _selectedSizePrice + toppingsPrice;
    notifyListeners();
  }
}
