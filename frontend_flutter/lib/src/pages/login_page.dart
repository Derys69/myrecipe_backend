import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../src/api_client.dart';
import '../../src/session.dart';
import 'recipes_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(text: 'user1@mail.com');
  final _passwordController = TextEditingController(text: '12345');
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: _loading ? null : () async {
                setState(() { _loading = true; _error = null; });
                try {
                  final api = context.read<ApiClient>();
                  final token = await api.login(_emailController.text.trim(), _passwordController.text);
                  context.read<SessionState>().setToken(token);
                  if (!mounted) return;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RecipesPage()));
                } catch (e) {
                  setState(() { _error = e.toString(); });
                } finally {
                  setState(() { _loading = false; });
                }
              },
              child: _loading ? const CircularProgressIndicator() : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

