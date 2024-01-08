import 'package:flutter/material.dart';
import 'package:pizza_yours_test/controllers/pizza_order_controller.dart';
import 'package:pizza_yours_test/model/pizza.dart';
import 'package:provider/provider.dart';

class PizzaOrdersPage extends StatefulWidget {
  const PizzaOrdersPage({super.key});

  @override
  State<PizzaOrdersPage> createState() => _PizzaOrdersPageState();
}

class _PizzaOrdersPageState extends State<PizzaOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PizzaOrderController>();
    Future.delayed(const Duration(milliseconds: 500), () {
      state.calculatePrice();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Pizza'),
            const SizedBox(height: 12),
            Row(
              children: pizzaList
                  .map(
                    (item) => Expanded(
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(item.imageSrc, fit: BoxFit.cover),
                            const SizedBox(height: 8),
                            Text(item.name),
                            const SizedBox(height: 8),
                            Text('\$${item.price.toString()}'),
                            const SizedBox(height: 8),
                            Radio<int>(
                              value: item.id!,
                              groupValue: state.selectedPizzaId ?? 10,
                              onChanged: (newVal) {
                                context
                                    .read<PizzaOrderController>()
                                    .handlePizzaRadio(item.id!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text('Size'),
            const SizedBox(height: 8),
            Row(
              children: sizes
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Radio(
                            value: item.id,
                            groupValue: state.selectedSizeId,
                            onChanged: (newVal) {
                              context
                                  .read<PizzaOrderController>()
                                  .handleSizeRadio(item.id!);
                            },
                          ),
                          Text(item.name),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text('Toppings'),
            const SizedBox(height: 8),
            Wrap(
              children: toppings
                  .map(
                    (item) => SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        value: item.checked,
                        enabled: state.selectedPizzaId != null,
                        onChanged: (value) {
                          context
                              .read<PizzaOrderController>()
                              .handleToppingCheckbox(
                                toppingId: item.id,
                                newValue: value!,
                              );
                        },
                        title: Text(item.name),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text('Price'),
            Text('\$${state.totalPrice}'),
          ],
        ),
      ),
    );
  }
}

List<Pizza> pizzaList = [
  Pizza(
    name: 'Pizza Carbona',
    imageSrc:
        'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    price: 8,
  ),
  Pizza(
    name: 'Pizza Sausage',
    imageSrc:
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65?q=80&w=1928&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    price: 10,
  ),
  Pizza(
    name: 'Pizza Cheese',
    imageSrc:
        'https://images.unsplash.com/photo-1552539618-7eec9b4d1796?q=80&w=2002&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    price: 12,
  ),
];

List<SizePizza> sizes = [
  SizePizza(
    name: 'Small',
    price: -1,
  ),
  SizePizza(
    name: 'Medium',
    price: 0,
  ),
  SizePizza(
    name: 'Large',
    price: 2,
  ),
];

List<Topping> toppings = [
  Topping(
    name: 'Avocado',
    price: 1,
  ),
  Topping(
    name: 'Broccoli',
    price: 1,
  ),
  Topping(
    name: 'Onions',
    price: 1,
  ),
  Topping(
    name: 'Zucchini',
    price: 1,
  ),
  Topping(
    name: 'Lobster',
    price: 2,
  ),
  Topping(
    name: 'Oyster',
    price: 2,
  ),
  Topping(
    name: 'Salmon',
    price: 2,
  ),
  Topping(
    name: 'Tuna',
    price: 2,
  ),
  Topping(
    name: 'Bacon',
    price: 3,
  ),
  Topping(
    name: 'Duck',
    price: 3,
  ),
  Topping(
    name: 'Ham',
    price: 3,
  ),
  Topping(
    name: 'Sausage',
    price: 3,
  ),
];
