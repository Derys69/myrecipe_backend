import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/api_client.dart';
import 'src/session.dart';
import 'src/pages/login_page.dart';
import 'src/pages/dashboard_page.dart';
import 'src/router/app_router.dart';
import 'src/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionState()),
        Provider(create: (_) => ApiClient(baseUrl: const String.fromEnvironment('API_BASE_URL', defaultValue: 'http://localhost:8081'))),
      ],
      child: const _Root(),
    );
  }
}

class _Root extends StatefulWidget {
  const _Root();

  @override
  State<_Root> createState() => _RootState();
}

class _RootState extends State<_Root> {
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final session = context.read<SessionState>();
    await session.loadToken();
    final api = context.read<ApiClient>();
    api.token = session.token;
    if (mounted) setState(() => _loaded = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return MaterialApp(title: 'MyRecipeApp', theme: AppTheme.light(), darkTheme: AppTheme.dark(), home: const Scaffold(body: Center(child: CircularProgressIndicator())));
    }
    return Consumer<SessionState>(builder: (context, session, _) {
      final router = createRouter(isAuthenticated: session.isAuthenticated);
      return MaterialApp.router(
        title: 'MyRecipeApp',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        routerConfig: router,
      );
    });
  }
}
