import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../features/home/views/home_page.dart';
import 'features/favorites/views/favorite_recipes.dart';
import 'features/meal_planner/views/weekly_meal_plan.dart';

class Layout extends ConsumerStatefulWidget {
  const Layout({super.key});

  @override
  ConsumerState<Layout> createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  int _currentPage = 0;
  bool _isOnline = true;

  final List<Widget> _onlinePages = const [
    HomePage(),
    FavoriteRecipesPage(),
    WeeklyMealPlanPage(),
  ];

  final List<Widget> _offlinePages = const [
    FavoriteRecipesPage(),
    WeeklyMealPlanPage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();

    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      setState(() {
        _isOnline = results.any((result) => result != ConnectivityResult.none);

        if (!_isOnline && _currentPage == 0) {
          _currentPage = 0;
        }
      });
    });
  }

  void _checkInitialConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (mounted) {
      setState(() {
        _isOnline = connectivityResult.any((result) => result != ConnectivityResult.none);
        if (!_isOnline) {
          _currentPage = 0;
        }
      });
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = _isOnline ? _onlinePages : _offlinePages;

    final navItems = _isOnline
        ? const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Weekly Meal Plan',
            ),
          ]
        : const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Weekly Meal Plan',
            ),
          ];

    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: navItems,
      ),
    );
  }
}
