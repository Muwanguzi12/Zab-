import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'home_screen.dart';
import 'sessions_screen.dart';
import 'clubs_screen.dart';
import 'tutors_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SessionsScreen(),
    const ClubsScreen(),
    const TutorsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(LucideIcons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.headphones),
              label: 'Sessions',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.users),
              label: 'Clubs',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.userPlus),
              label: 'Tutors',
            ),
          ],
        ),
      ),
    );
  }
}
