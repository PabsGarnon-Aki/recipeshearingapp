import '../models/recipe_model.dart';

class RecipeService {
  // Mock data for recipes
  final List<Recipe> _recipes = [
    Recipe(
      id: '1',
      title: 'Spaghetti Carbonara',
      description: 'A classic Italian pasta dish with eggs, cheese, and pancetta.',
      authorId: '1',
      authorName: 'John Doe',
      ingredients: [
        '400g spaghetti',
        '200g pancetta or guanciale',
        '4 large eggs',
        '100g Pecorino Romano cheese',
        '100g Parmigiano Reggiano',
        'Black pepper',
        'Salt',
      ],
      instructions: [
        'Bring a large pot of salted water to boil and cook spaghetti according to package directions.',
        'Meanwhile, cut the pancetta into small cubes and cook in a large skillet until crispy.',
        'In a bowl, whisk together eggs, grated cheeses, and black pepper.',
        'Drain pasta, reserving 1 cup of pasta water.',
        'Add hot pasta to the skillet with pancetta, remove from heat.',
        'Quickly stir in the egg mixture, adding pasta water as needed to create a creamy sauce.',
        'Serve immediately with extra cheese and black pepper.',
      ],
      cookingTime: 20,
      servings: 4,
      difficulty: 'Medium',
      category: 'Dinner',
      rating: 4.5,
      reviewCount: 12,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Recipe(
      id: '2',
      title: 'Chocolate Chip Cookies',
      description: 'Soft and chewy chocolate chip cookies that are perfect for any occasion.',
      authorId: '1',
      authorName: 'John Doe',
      ingredients: [
        '2 1/4 cups all-purpose flour',
        '1/2 tsp baking soda',
        '1 cup unsalted butter, softened',
        '1/2 cup granulated sugar',
        '1 cup packed brown sugar',
        '1 tsp vanilla extract',
        '2 large eggs',
        '2 cups chocolate chips',
        '1/2 tsp salt',
      ],
      instructions: [
        'Preheat oven to 375°F (190°C).',
        'In a small bowl, mix flour, baking soda, and salt.',
        'In a large bowl, cream butter and sugars until light and fluffy.',
        'Beat in vanilla and eggs one at a time.',
        'Gradually mix in the flour mixture.',
        'Stir in chocolate chips.',
        'Drop rounded tablespoons onto ungreased baking sheets.',
        'Bake for 9-11 minutes or until golden brown.',
        'Cool on baking sheets for 2 minutes, then transfer to wire racks.',
      ],
      cookingTime: 25,
      servings: 24,
      difficulty: 'Easy',
      category: 'Dessert',
      rating: 4.8,
      reviewCount: 8,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Recipe(
      id: '3',
      title: 'Chicken Stir Fry',
      description: 'Quick and healthy chicken stir fry with vegetables.',
      authorId: '1',
      authorName: 'John Doe',
      ingredients: [
        '500g chicken breast, sliced',
        '2 tbsp soy sauce',
        '2 tbsp oyster sauce',
        '1 tbsp cornstarch',
        '2 tbsp vegetable oil',
        '3 cloves garlic, minced',
        '1 inch ginger, minced',
        '2 cups mixed vegetables',
        '2 tbsp sesame oil',
        'Salt and pepper to taste',
      ],
      instructions: [
        'Slice chicken breast into thin strips.',
        'Marinate chicken with soy sauce, oyster sauce, and cornstarch for 15 minutes.',
        'Heat oil in a wok or large skillet over high heat.',
        'Add garlic and ginger, stir for 30 seconds.',
        'Add chicken and stir fry until cooked through, about 5 minutes.',
        'Add vegetables and stir fry for 3-4 minutes.',
        'Season with salt and pepper, drizzle with sesame oil.',
        'Serve hot over rice.',
      ],
      cookingTime: 30,
      servings: 4,
      difficulty: 'Easy',
      category: 'Dinner',
      rating: 4.2,
      reviewCount: 6,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  // Get all recipes
  Future<List<Recipe>> getAllRecipes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _recipes;
  }

  // Get recipe by ID
  Future<Recipe?> getRecipeById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _recipes.firstWhere((recipe) => recipe.id == id);
    } catch (e) {
      return null;
    }
  }

  // Create new recipe
  Future<Recipe> createRecipe(Recipe recipe) async {
    await Future.delayed(const Duration(seconds: 1));
    final newRecipe = recipe.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
    );
    _recipes.add(newRecipe);
    return newRecipe;
  }

  // Update recipe
  Future<Recipe?> updateRecipe(String id, Recipe updatedRecipe) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _recipes.indexWhere((recipe) => recipe.id == id);
    if (index != -1) {
      _recipes[index] = updatedRecipe;
      return updatedRecipe;
    }
    return null;
  }

  // Delete recipe
  Future<bool> deleteRecipe(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _recipes.indexWhere((recipe) => recipe.id == id);
    if (index != -1) {
      _recipes.removeAt(index);
      return true;
    }
    return false;
  }

  // Search recipes
  Future<List<Recipe>> searchRecipes(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _recipes.where((recipe) =>
        recipe.title.toLowerCase().contains(query.toLowerCase()) ||
        recipe.description.toLowerCase().contains(query.toLowerCase()) ||
        recipe.category.toLowerCase().contains(query.toLowerCase())).toList();
  }

  // Get recipes by category
  Future<List<Recipe>> getRecipesByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _recipes.where((recipe) => recipe.category == category).toList();
  }

  // Get user's recipes
  Future<List<Recipe>> getUserRecipes(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _recipes.where((recipe) => recipe.authorId == userId).toList();
  }
}
