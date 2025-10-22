import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../src/api_client.dart';
import '../../src/session.dart';
import 'package:go_router/go_router.dart';
import 'login_page.dart';
import 'recipe_detail_page.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final _searchController = TextEditingController();
  bool _loading = true;
  String? _error;
  List<dynamic> _recipes = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final api = context.read<ApiClient>();
      final data = await api.getRecipes();
      setState(() { _recipes = data; });
    } catch (e) {
      setState(() { _error = e.toString(); });
    } finally {
      setState(() { _loading = false; });
    }
  }

  Future<void> _search() async {
    final q = _searchController.text.trim();
    if (q.isEmpty) { await _load(); return; }
    setState(() { _loading = true; _error = null; });
    try {
      final api = context.read<ApiClient>();
      final data = await api.searchRecipes(q);
      setState(() { _recipes = data; });
    } catch (e) {
      setState(() { _error = e.toString(); });
    } finally {
      setState(() { _loading = false; });
    }
  }

  Future<void> _toggleFavorite(int recipeId) async {
    try {
      final session = context.read<SessionState>();
      final api = context.read<ApiClient>();
      api.token = session.token;
      // contoh user_id: 1 (sesuai dummy)
      await api.toggleFavorite(userId: 1, recipeId: recipeId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Toggled favorite')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        actions: [
          IconButton(onPressed: _load, icon: const Icon(Icons.refresh)),
          IconButton(
            onPressed: () async {
              await context.read<SessionState>().clear();
              if (!mounted) return;
              context.go('/login');
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Cari bahan (cth: telur)'),
                    onSubmitted: (_) => _search(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _search, child: const Text('Cari')),
              ],
            ),
          ),
          if (_loading) const LinearProgressIndicator(),
          if (_error != null) Padding(padding: const EdgeInsets.all(8.0), child: Text(_error!, style: const TextStyle(color: Colors.red))),
          Expanded(
            child: ListView.separated(
              itemCount: _recipes.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final r = _recipes[index] as Map<String, dynamic>;
                final id = (r['ID'] ?? r['id']) as int? ?? 0;
                final title = (r['Title'] ?? r['title'])?.toString() ?? '-';
                final desc = (r['Description'] ?? r['description'])?.toString() ?? '';
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: ListTile(
                    title: Text(title),
                    subtitle: Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () => _toggleFavorite(id),
                    ),
                    onTap: () => context.push('/recipes/detail', extra: r),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

