import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  String _field(Map<String, dynamic> r, String a, String b) => (r[a] ?? r[b])?.toString() ?? '';

  @override
  Widget build(BuildContext context) {
    final title = _field(recipe, 'Title', 'title');
    final description = _field(recipe, 'Description', 'description');
    final ingredients = _field(recipe, 'Ingredients', 'ingredients');
    final steps = _field(recipe, 'Steps', 'steps');
    final categoryName = (recipe['Category']?['Name'] ?? recipe['category']?['name'])?.toString();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (categoryName != null && categoryName.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Chip(label: Text(categoryName)),
              ),
            if (description.isNotEmpty) ...[
              const Text('Deskripsi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text(description),
              const SizedBox(height: 16),
            ],
            if (ingredients.isNotEmpty) ...[
              const Text('Bahan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text(ingredients),
              const SizedBox(height: 16),
            ],
            if (steps.isNotEmpty) ...[
              const Text('Langkah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text(steps),
            ],
          ],
        ),
      ),
    );
  }
}

