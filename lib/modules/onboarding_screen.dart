import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final String loginRoute;
  
  const OnboardingScreen({Key? key, required this.loginRoute}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Lista de páginas do onboarding
  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      title: "Bem-vindo ao App",
      description: "Descubra todas as funcionalidades incríveis que preparamos para você",
      imagePath: "assets/images/onboarding_1.png",
    ),
    OnboardingPageData(
      title: "Rápido e Fácil",
      description: "Nossa interface é intuitiva e otimizada para facilitar sua experiência",
      imagePath: "assets/images/onboarding_2.png",
    ),
    OnboardingPageData(
      title: "Comece Agora",
      description: "Crie uma conta ou faça login para aproveitar todos os recursos",
      imagePath: "assets/images/onboarding_3.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Na última página, navegar para a tela de login
      Navigator.of(context).pushReplacementNamed(widget.loginRoute);
    }
  }

  void _onSkip() {
    Navigator.of(context).pushReplacementNamed(widget.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Botão de pular no canto superior direito
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _onSkip,
                child: const Text(
                  "Pular",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            
            // PageView com as telas de onboarding
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(pageData: _pages[index]);
                },
              ),
            ),
            
            // Indicadores de página
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index 
                        ? Theme.of(context).primaryColor 
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            
            // Botão de próximo ou começar
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onNextPage,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Começar" : "Próximo",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para cada página do onboarding
class OnboardingPage extends StatelessWidget {
  final OnboardingPageData pageData;
  
  const OnboardingPage({Key? key, required this.pageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagem
          Image.asset(
            pageData.imagePath,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const SizedBox(height: 40),
          
          // Título
          Text(
            pageData.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          
          // Descrição
          Text(
            pageData.description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Modelo de dados para cada página
class OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;
  
  OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
