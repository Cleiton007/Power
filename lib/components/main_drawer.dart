import 'package:flutter/material.dart';
import 'package:power/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItemDrawer(IconData icon, String label, BuildContext context, String rota) {
    return ListTile(
      selectedColor: Colors.red,
      hoverColor: Colors.red,
      selectedTileColor: Colors.red,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(rota, arguments: const MainDrawer());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Navegação",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          _createItemDrawer(Icons.home, "Home", context, AppRoutes.HOME),
          _createItemDrawer(Icons.person, "Alunos", context, AppRoutes.ALUNOS_SCREEN),
          _createItemDrawer(Icons.monetization_on, "Pagamentos", context, AppRoutes.PAGAMENTOS_SCREEN),
        ],
      ),
    );
  }
}
