import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class MyVideosScreen extends StatelessWidget {
  const MyVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemBackground.withValues(alpha: 0.8),
          border: null,
          middle: const Text(
            'My Videos',
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
          title: const Text('My Videos'),
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
            Colors.purple.shade50.withValues(alpha: 0.3),
            Colors.white,
          ],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Your Creations',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Browse and manage your AI-generated videos',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Empty State
          SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.purple.shade200.withValues(alpha: 0.5),
                            Colors.blue.shade200.withValues(alpha: 0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Platform.isIOS 
                            ? CupertinoIcons.film 
                            : Icons.movie_outlined,
                        size: 60,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'No Videos Yet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Create your first video to see it here',
                      textAlign: TextAlign.center,
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
        ],
      ),
    );
  }
}
