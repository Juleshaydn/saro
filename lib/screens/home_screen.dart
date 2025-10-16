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

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const GenerateVideoScreen(),
    const MyVideosScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context).withValues(alpha: 0.8),
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 0.5,
                ),
              ),
            ),
            child: SafeArea(
              child: CupertinoTabBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  _tabController.animateTo(index);
                  setState(() {
                    _currentIndex = index;
                  });
                },
                backgroundColor: Colors.transparent,
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
            ),
          ),
        ),
      );
    } else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: _screens,
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              _tabController.animateTo(index);
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
        ),
      );
    }
  }
}
