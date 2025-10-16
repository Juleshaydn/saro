import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'generate_video_screen.dart';
import 'my_videos_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const GenerateVideoScreen(),
    const MyVideosScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: CupertinoColors.systemBackground.withOpacity(0.8),
          activeColor: CupertinoColors.activeBlue,
          inactiveColor: CupertinoColors.systemGrey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.videocam_fill),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.play_rectangle_fill),
              label: 'My Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return _screens[index];
            },
          );
        },
      );
    } else {
      return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.videocam_outlined),
              selectedIcon: Icon(Icons.videocam),
              label: 'Create',
            ),
            NavigationDestination(
              icon: Icon(Icons.video_library_outlined),
              selectedIcon: Icon(Icons.video_library),
              label: 'My Videos',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
    }
  }
}

