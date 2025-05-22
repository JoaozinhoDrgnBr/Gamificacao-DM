import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
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
    _controller = PersistentTabController(initialIndex: 1); // Inicia no centro (Home)
  }

  List<Widget> _buildScreens() {
    return [
      const PlaceholderScreen(title: 'Favoritos'),
      const HomeScreen(), // Tela Home no centro
      const PlaceholderScreen(title: 'Configurações'),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Favoritos",
        activeColorPrimary: Colors.red.shade600,
        inactiveColorPrimary: Colors.grey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade300,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.home,
            color: Colors.white,
            size: 28,
          ),
        ),
        title: "Home",
        activeColorPrimary: Colors.blue.shade600,
        inactiveColorPrimary: Colors.blue.shade600,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Config",
        activeColorPrimary: Colors.green.shade600,
        inactiveColorPrimary: Colors.grey.shade400,
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
        borderRadius: BorderRadius.circular(16.0),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
      ),
      navBarStyle: NavBarStyle.style13, // Melhor estilo para ícone central destacado
    );
  }
}

// Home Screen com Drawer
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // Controlador para a drawer
  final _advancedDrawerController = AdvancedDrawerController();
  
  // Controlador de animação para o fade
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

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
    'native_scaffold': false,
    'persistent_bottom_nav_bar': true,
    'convex_bottom_bar': false,
  };

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    // Inicia a animação de fade
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

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
      // Conteúdo principal usando Scaffold padrão com animação de fade
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Gems'),
            centerTitle: true,
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
            elevation: 0,
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
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade600,
                  Colors.blue.shade50,
                ],
                stops: const [0.0, 0.3],
              ),
            ),
            child: Column(
              children: [
                // Cabeçalho com título
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Column(
                    children: [
                      const Text(
                        'Flutter Gems',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gerencie seus pacotes Flutter',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade100,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Lista de pacotes
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Título da seção
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.inventory_2,
                                color: Colors.blue.shade600,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Pacotes',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Lista scrollável de pacotes
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ListView.builder(
                              itemCount: _packages.length,
                              itemBuilder: (context, index) {
                                final packageName = _packages.keys.elementAt(index);
                                final isEnabled = _packages[packageName] ?? false;

                                return OpenContainer(
                                  closedElevation: 0,
                                  openElevation: 0,
                                  transitionType: ContainerTransitionType.fade,
                                  transitionDuration: const Duration(milliseconds: 500),
                                  closedBuilder: (BuildContext context, VoidCallback openContainer) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        onTap: openContainer,
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 12,
                                        ),
                                        leading: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: isEnabled
                                                ? Colors.green.shade100
                                                : Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Icon(
                                            Icons.extension,
                                            color: isEnabled
                                                ? Colors.green.shade600
                                                : Colors.grey.shade600,
                                            size: 24,
                                          ),
                                        ),
                                        title: Text(
                                          packageName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: isEnabled
                                                ? Colors.black87
                                                : Colors.grey.shade600,
                                          ),
                                        ),
                                        subtitle: Container(
                                          margin: const EdgeInsets.only(top: 4),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isEnabled
                                                ? Colors.green.shade50
                                                : Colors.grey.shade50,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            isEnabled ? 'Ativado' : 'Desativado',
                                            style: TextStyle(
                                              color: isEnabled
                                                  ? Colors.green.shade700
                                                  : Colors.grey.shade600,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
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
                                          activeTrackColor: Colors.green.shade200,
                                        ),
                                      ),
                                    );
                                  },
                                  openBuilder: (BuildContext context, VoidCallback closeContainer) {
                                    return PackageDetailScreen(packageName: packageName);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: const AlwaysStoppedAnimation(1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.white,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    title == 'Favoritos' ? Icons.favorite : Icons.settings,
                    size: 80,
                    color: Colors.blue.shade400,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Esta seção estará disponível em breve',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
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
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: FadeTransition(
        opacity: const AlwaysStoppedAnimation(1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade100,
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.extension,
                          size: 60,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        packageName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Descrição',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Este é o pacote $packageName. Aqui você pode ver mais detalhes sobre este pacote Flutter e como ele pode ser usado em seus projetos.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}