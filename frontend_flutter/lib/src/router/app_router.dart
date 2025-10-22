import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';
import '../pages/recipes_page.dart';
import '../pages/recipe_detail_page.dart';

GoRouter createRouter({required bool isAuthenticated}) {
  return GoRouter(
    initialLocation: isAuthenticated ? '/home' : '/login',
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(child: DashboardPage()),
      ),
      GoRoute(
        path: '/recipes',
        pageBuilder: (context, state) => const MaterialPage(child: RecipesPage()),
        routes: [
          GoRoute(
            path: 'detail',
            pageBuilder: (context, state) {
              final recipe = state.extra as Map<String, dynamic>;
              return MaterialPage(child: RecipeDetailPage(recipe: recipe));
            },
          ),
        ],
      ),
    ],
  );
}

