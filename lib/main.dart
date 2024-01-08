import 'package:flutter/material.dart';
import 'package:pizza_yours_test/controllers/pizza_order_controller.dart';
import 'package:pizza_yours_test/views/pizza_orders_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PizzaOrderController(),
        child: const PizzaOrdersPage(),
      ),
    );
  }
}
