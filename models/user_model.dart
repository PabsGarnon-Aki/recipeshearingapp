class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final List<String> favoriteRecipes;
  final List<String> createdRecipes;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.favoriteRecipes = const [],
    this.createdRecipes = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImageUrl: json['profileImageUrl'],
      favoriteRecipes: List<String>.from(json['favoriteRecipes'] ?? []),
      createdRecipes: List<String>.from(json['createdRecipes'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'favoriteRecipes': favoriteRecipes,
      'createdRecipes': createdRecipes,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    List<String>? favoriteRecipes,
    List<String>? createdRecipes,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      favoriteRecipes: favoriteRecipes ?? this.favoriteRecipes,
      createdRecipes: createdRecipes ?? this.createdRecipes,
    );
  }
}
