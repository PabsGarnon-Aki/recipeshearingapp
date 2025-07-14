class Recipe {
  final String id;
  final String title;
  final String description;
  final String authorId;
  final String authorName;
  final List<String> ingredients;
  final List<String> instructions;
  final int cookingTime; // in minutes
  final int servings;
  final String difficulty; // Easy, Medium, Hard
  final String category; // Breakfast, Lunch, Dinner, Dessert, Snack
  final String? imageUrl;
  final double rating;
  final int reviewCount;
  final DateTime createdAt;
  final bool isPublic;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.authorId,
    required this.authorName,
    required this.ingredients,
    required this.instructions,
    required this.cookingTime,
    required this.servings,
    required this.difficulty,
    required this.category,
    this.imageUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.createdAt,
    this.isPublic = true,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      authorId: json['authorId'] ?? '',
      authorName: json['authorName'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      cookingTime: json['cookingTime'] ?? 0,
      servings: json['servings'] ?? 1,
      difficulty: json['difficulty'] ?? 'Easy',
      category: json['category'] ?? 'Dinner',
      imageUrl: json['imageUrl'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      isPublic: json['isPublic'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'authorId': authorId,
      'authorName': authorName,
      'ingredients': ingredients,
      'instructions': instructions,
      'cookingTime': cookingTime,
      'servings': servings,
      'difficulty': difficulty,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'createdAt': createdAt.toIso8601String(),
      'isPublic': isPublic,
    };
  }

  Recipe copyWith({
    String? id,
    String? title,
    String? description,
    String? authorId,
    String? authorName,
    List<String>? ingredients,
    List<String>? instructions,
    int? cookingTime,
    int? servings,
    String? difficulty,
    String? category,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    DateTime? createdAt,
    bool? isPublic,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      cookingTime: cookingTime ?? this.cookingTime,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      createdAt: createdAt ?? this.createdAt,
      isPublic: isPublic ?? this.isPublic,
    );
  }
}
