import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/video_model.dart';
import '../services/openai_service.dart';

class VideoProvider with ChangeNotifier {
  final OpenAIService _openAIService = OpenAIService();
  final List<VideoModel> _videos = [];

  List<VideoModel> get videos => List.unmodifiable(_videos);

  VideoProvider() {
    _loadVideos();
  }

  /// Load videos from local storage
  Future<void> _loadVideos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final videosJson = prefs.getStringList('videos') ?? [];
      
      _videos.clear();
      _videos.addAll(
        videosJson.map((json) => VideoModel.fromJson(jsonDecode(json))),
      );
      
      // Sort by created date, newest first
      _videos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading videos: $e');
    }
  }

  /// Save videos to local storage
  Future<void> _saveVideos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final videosJson = _videos.map((v) => jsonEncode(v.toJson())).toList();
      await prefs.setStringList('videos', videosJson);
    } catch (e) {
      debugPrint('Error saving videos: $e');
    }
  }

  /// Generate a new video/image
  Future<String> generateVideo(String prompt) async {
    if (prompt.trim().isEmpty) {
      throw Exception('Prompt cannot be empty');
    }

    // Create a new video model with pending status
    final video = VideoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      prompt: prompt,
      status: VideoStatus.processing,
      createdAt: DateTime.now(),
    );

    // Add to list and save
    _videos.insert(0, video);
    notifyListeners();
    await _saveVideos();

    try {
      // Generate the image
      final imageUrl = await _openAIService.generatePortraitImage(
        prompt: prompt,
      );

      // Update the video with the generated image
      final index = _videos.indexWhere((v) => v.id == video.id);
      if (index != -1) {
        _videos[index] = video.copyWith(
          imageUrl: imageUrl,
          status: VideoStatus.completed,
        );
        notifyListeners();
        await _saveVideos();
      }

      return video.id;
    } catch (e) {
      // Update status to failed
      final index = _videos.indexWhere((v) => v.id == video.id);
      if (index != -1) {
        _videos[index] = video.copyWith(
          status: VideoStatus.failed,
          errorMessage: e.toString(),
        );
        notifyListeners();
        await _saveVideos();
      }
      rethrow;
    }
  }

  /// Delete a video
  Future<void> deleteVideo(String id) async {
    _videos.removeWhere((v) => v.id == id);
    notifyListeners();
    await _saveVideos();
  }

  /// Refresh videos
  Future<void> refresh() async {
    await _loadVideos();
  }
}

