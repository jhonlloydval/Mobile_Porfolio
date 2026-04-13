import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lloyd\'s Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C4DFF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF090B14),
        textTheme: Typography.whiteMountainView,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedSection = 1;
  int _selectedNav = 0;

  final List<Map<String, String>> _sections = [
    {
      'title': 'Skills & Hobbies',
      'description': 'A glance at expertise, tools, and personal interests.',
      'button': 'Explore Skills',
    },
    {
      'title': 'Projects',
      'description':
          'Mobile-first builds, clean interfaces, and polished apps.',
      'button': 'View Projects',
    },
    {
      'title': 'Achievements & Certificates',
      'description': 'Recognition, milestones, and professional growth.',
      'button': 'See Achievements',
    },
  ];

  final List<String> _navItems = ['Home', 'Personal Details', 'More'];

  Widget _sectionCard(int index) {
    final item = _sections[index];
    final bool isSelected = index == _selectedSection;

    return GestureDetector(
      onTap: () => setState(() => _selectedSection = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        width: 260,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Color.fromRGBO(255, 255, 255, isSelected ? 0.12 : 0.07),
          border: Border.all(
            color: isSelected
                ? const Color.fromRGBO(255, 255, 255, 0.28)
                : Colors.transparent,
          ),
          boxShadow: [
            const BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.35),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 11),
            Text(
              item['description']!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.16),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(item['button']!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigationButton(int index) {
    final bool isActive = _selectedNav == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedNav = index),
        child: AnimatedContainer(
          height: 56,
          duration: const Duration(milliseconds: 240),
          margin: EdgeInsets.only(left: index == 0 ? 0 : 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isActive
                ? const Color.fromRGBO(255, 255, 255, 0.16)
                : const Color.fromRGBO(255, 255, 255, 0.06),
          ),
          alignment: Alignment.center,
          child: Text(
            _navItems[index],
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white70,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _navContent() {
    switch (_selectedNav) {
      case 1:
        return const Text(
          'Personal details section is coming into view.\nUpdate this page with your bio, location, experience, and contact info.',
          style: TextStyle(color: Colors.white70, height: 1.6, fontSize: 15),
        );
      case 2:
        return const Text(
          'More content is under development.\nUse this section for contact links, testimonials, or extra resources.',
          style: TextStyle(color: Colors.white70, height: 1.6, fontSize: 15),
        );
      default:
        return const Text(
          'This page highlights the main portfolio overview with your core story, scrollable sections, and elegant dark theme styling.',
          style: TextStyle(color: Colors.white70, height: 1.6, fontSize: 15),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF05070F), Color(0xFF121623)],
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(255, 255, 255, 0.07),
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: -50,
            child: Container(
              width: 190,
              height: 190,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: 20,
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 0.05),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(color: Colors.transparent),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    "Lloyd's Portfolio",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome to Lloyd's mobile portfolio",
                    style: TextStyle(
                      fontSize: 17,
                      color: const Color.fromRGBO(255, 255, 255, 0.72),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    width: 160,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo.shade300,
                          const Color.fromRGBO(255, 255, 255, 0.85),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Featured sections',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Swipe to explore',
                              style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.55,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 260,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _sections.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 18),
                            itemBuilder: (context, index) =>
                                _sectionCard(index),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Navigation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 0.92),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: List.generate(
                            _navItems.length,
                            _navigationButton,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color.fromRGBO(255, 255, 255, 0.08),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _navItems[_selectedNav],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _navContent(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
