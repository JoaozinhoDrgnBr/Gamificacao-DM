// Passo 1: Adicione os pacotes ao seu pubspec.yaml
// dependencies:
//   flutter_advanced_drawer: ^1.3.5
//   native_scaffold: ^1.0.0

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:native_scaffold/native_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controlador para a drawer
  final _advancedDrawerController = AdvancedDrawerController();

  // Lista de pacotes com seus estados iniciais
  final Map<String, bool> _packages = {
    'flutter_native_splash': true,
    'animated_splash_screen': true,
    'introduction_screen': true,
    'onboarding': false,
    'flutter_login': true,
    'animated_login': false,
    'animations': true,
    'lottie': false,
    'flutter_zoom_drawer': false,
    'flutter_advanced_drawer': true,
    'getx_scaffold': false,
    'native_scaffold': true,
    'persistent_bottom_nav_bar': true,
    'convex_bottom_bar': false,
  };

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey.shade900,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // Drawer com os tópicos
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.code,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () => _advancedDrawerController.hideDrawer(),
                  leading: const Icon(Icons.home),
                  title: const Text('Flutter Gems'),
                ),
                ListTile(
                  onTap: () => _advancedDrawerController.hideDrawer(),
                  leading: const Icon(Icons.inventory_2),
                  title: const Text('Pacotes'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Flutter Gems v1.0.0'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Conteúdo principal usando Native Scaffold
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Gems'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: NativeScaffold(
  title: 'Flutter Gems',
  child: Column(
    children: [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Pacotes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            itemCount: _packages.length,
            itemBuilder: (context, index) {
              final packageName = _packages.keys.elementAt(index);
              final isEnabled = _packages[packageName] ?? false;

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isEnabled
                          ? Colors.green.shade100
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.extension,
                      color: isEnabled
                          ? Colors.green.shade600
                          : Colors.grey.shade600,
                    ),
                  ),
                  title: Text(
                    packageName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: isEnabled
                          ? Colors.black87
                          : Colors.grey.shade600,
                    ),
                  ),
                  subtitle: Text(
                    isEnabled ? 'Ativado' : 'Desativado',
                    style: TextStyle(
                      color: isEnabled
                          ? Colors.green.shade600
                          : Colors.grey.shade500,
                      fontSize: 12,
                    ),
                  ),
                  trailing: Switch(
                    value: isEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        _packages[packageName] = value;
                      });
                    },
                    activeColor: Colors.green.shade600,
                    inactiveThumbColor: Colors.grey.shade400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _handleMenuButtonPressed() {
    // Controla a abertura e fechamento da drawer
    _advancedDrawerController.showDrawer();
  }
}