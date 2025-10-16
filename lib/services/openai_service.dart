import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class OpenAIService {
  static const String _apiKey = ApiConfig.openAiApiKey;
  static const String _baseUrl = 'https://api.openai.com/v1';

  /// Generate an image using DALL-E 3 (GPT-image-1-mini equivalent)
  /// This is the cheapest option for testing
  Future<String> generateImage({
    required String prompt,
    String size = '1024x1024', // square for testing
    String quality = 'standard', // standard is cheaper than hd
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'dall-e-3',
          'prompt': prompt,
          'n': 1,
          'size': size,
          'quality': quality,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'][0]['url'] as String;
      } else {
        final error = jsonDecode(response.body);
        throw Exception(
          error['error']['message'] ?? 'Failed to generate image',
        );
      }
    } catch (e) {
      throw Exception('Error generating image: $e');
    }
  }

  /// Generate an image with portrait orientation (9:16 ratio)
  /// Using 1024x1792 for vertical format
  Future<String> generatePortraitImage({
    required String prompt,
  }) async {
    return generateImage(
      prompt: prompt,
      size: '1024x1792', // Portrait orientation
      quality: 'standard',
    );
  }
}

