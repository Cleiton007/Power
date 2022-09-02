import 'package:flutter/material.dart';
import 'package:power/screens/categories_screen.dart';

class GymOverviewScreen extends StatelessWidget {
  const GymOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.help))
        ],
        centerTitle: true,
        title: Text('Minha Academia'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            width: 300,
            child: Card(
              color: Color.fromARGB(221, 71, 69, 84),
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          const CategoriesScreens(),
        ],
      ),
    );
  }
}
