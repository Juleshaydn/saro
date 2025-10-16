import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemBackground.withValues(alpha: 0.8),
          border: null,
          middle: const Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
        ),
        child: SafeArea(
          child: _buildContent(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: _buildContent(context),
        ),
      );
    }
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.pink.shade50.withValues(alpha: 0.3),
            Colors.white,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // Profile Avatar
            _buildProfileAvatar(),
            const SizedBox(height: 16),
            
            // User Info
            Text(
              'Guest User',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Sign in to save your progress',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 32),
            
            // Stats
            _buildStatsSection(),
            const SizedBox(height: 32),
            
            // Settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade900,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingsList(context),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade300,
            Colors.purple.shade300,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(
        Platform.isIOS ? CupertinoIcons.person_fill : Icons.person,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('Videos', '0'),
            Container(
              width: 1,
              height: 40,
              color: Colors.grey.shade300,
            ),
            _buildStatItem('Created', '0'),
            Container(
              width: 1,
              height: 40,
              color: Colors.grey.shade300,
            ),
            _buildStatItem('Shared', '0'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingItem(
            context,
            icon: Platform.isIOS ? CupertinoIcons.person : Icons.account_circle_outlined,
            title: 'Account',
            subtitle: 'Manage your account settings',
          ),
          const Divider(height: 24),
          _buildSettingItem(
            context,
            icon: Platform.isIOS ? CupertinoIcons.bell : Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Manage notification preferences',
          ),
          const Divider(height: 24),
          _buildSettingItem(
            context,
            icon: Platform.isIOS ? CupertinoIcons.lock : Icons.lock_outlined,
            title: 'Privacy',
            subtitle: 'Control your privacy settings',
          ),
          const Divider(height: 24),
          _buildSettingItem(
            context,
            icon: Platform.isIOS ? CupertinoIcons.info : Icons.info_outlined,
            title: 'About',
            subtitle: 'App version and information',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey.shade700,
          size: 24,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Platform.isIOS ? CupertinoIcons.chevron_right : Icons.chevron_right,
          color: Colors.grey.shade400,
          size: 20,
        ),
      ],
    );
  }
}
