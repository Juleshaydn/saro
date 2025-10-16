class VideoModel {
  final String id;
  final String prompt;
  final String? imageUrl;
  final VideoStatus status;
  final DateTime createdAt;
  final String? errorMessage;

  VideoModel({
    required this.id,
    required this.prompt,
    this.imageUrl,
    required this.status,
    required this.createdAt,
    this.errorMessage,
  });

  VideoModel copyWith({
    String? id,
    String? prompt,
    String? imageUrl,
    VideoStatus? status,
    DateTime? createdAt,
    String? errorMessage,
  }) {
    return VideoModel(
      id: id ?? this.id,
      prompt: prompt ?? this.prompt,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prompt': prompt,
      'imageUrl': imageUrl,
      'status': status.toString(),
      'createdAt': createdAt.toIso8601String(),
      'errorMessage': errorMessage,
    };
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      prompt: json['prompt'],
      imageUrl: json['imageUrl'],
      status: VideoStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => VideoStatus.pending,
      ),
      createdAt: DateTime.parse(json['createdAt']),
      errorMessage: json['errorMessage'],
    );
  }
}

enum VideoStatus {
  pending,
  processing,
  completed,
  failed,
}

