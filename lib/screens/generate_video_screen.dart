import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

class GenerateVideoScreen extends StatelessWidget {
  const GenerateVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemBackground.withValues(alpha: 0.8),
          border: null,
          middle: const Text(
            'Generate Video',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
        ),
        child: SafeArea(
          child: _buildIOSContent(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Generate Video'),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: _buildAndroidContent(context),
        ),
      );
    }
  }

  Widget _buildIOSContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50.withValues(alpha: 0.3),
            Colors.white,
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildHeroSection(),
            const SizedBox(height: 32),
            
            // Native iOS 26 Liquid Glass Card
            SizedBox(
              height: 400,
              child: const UiKitView(
                viewType: 'LiquidGlassGenerateCard',
                layoutDirection: TextDirection.ltr,
                creationParams: null,
                creationParamsCodec: StandardMessageCodec(),
              ),
            ),
            
            const SizedBox(height: 24),
            _buildOptionsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAndroidContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50.withValues(alpha: 0.3),
            Colors.white,
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildHeroSection(),
            const SizedBox(height: 32),
            _buildPromptSection(context),
            const SizedBox(height: 24),
            _buildOptionsSection(context),
            const SizedBox(height: 32),
            _buildGenerateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Your Video',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Describe your vision and let AI bring it to life',
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPromptSection(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: Colors.blue.shade600,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Video Prompt',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Describe the video you want to create...',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Options',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        Container(
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
              _buildOptionRow(
                context,
                icon: Platform.isIOS ? CupertinoIcons.time : Icons.access_time,
                title: 'Duration',
                value: '30 seconds',
              ),
              const Divider(height: 24),
              _buildOptionRow(
                context,
                icon: Platform.isIOS ? CupertinoIcons.rectangle : Icons.aspect_ratio,
                title: 'Aspect Ratio',
                value: '16:9',
              ),
              const Divider(height: 24),
              _buildOptionRow(
                context,
                icon: Platform.isIOS ? CupertinoIcons.paintbrush : Icons.palette,
                title: 'Style',
                value: 'Realistic',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionRow(BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey.shade600,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          Platform.isIOS ? CupertinoIcons.chevron_right : Icons.chevron_right,
          color: Colors.grey.shade400,
          size: 20,
        ),
      ],
    );
  }

  Widget _buildGenerateButton(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade500,
                Colors.purple.shade500,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Generate Video',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
