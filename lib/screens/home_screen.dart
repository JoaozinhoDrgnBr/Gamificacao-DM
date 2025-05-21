
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:native_scaffold/native_scaffold.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:animations/animations.dart';

// Classe principal do App com Bottom Navigation
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const PlaceholderScreen(title: 'Favoritos'),
      const PlaceholderScreen(title: 'Configurações'),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Favoritos",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Config",
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Estilo com ícone central destacado
    );
  }
}

// Home Screen com Drawer
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

// Tela de placeholder para outras abas
class PlaceholderScreen extends StatelessWidget {
  final String title;
  
  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              title == 'Favoritos' ? Icons.favorite : Icons.settings,
              size: 100,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de detalhes do pacote com animação de fade
class PackageDetailScreen extends StatelessWidget {
  final String packageName;
  
  const PackageDetailScreen({Key? key, required this.packageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(packageName),
      ),
      body: FadeTransition(
        opacity: const AlwaysStoppedAnimation(1.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.extension,
                      size: 80,
                      color: Colors.blue.shade600,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      packageName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Descrição',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Este é o pacote $packageName. Aqui você pode ver mais detalhes sobre este pacote Flutter.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}