import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/auth_provider.dart';
import 'screens/home_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import '/services/permission_service.dart'; // Import PermissionService

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure FlutterSecureStorage is initialized

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                AuthProvider()..checkAuth()), // ✅ Auto-check authentication
      ],
      child: const BookApp(),
    ),
  );
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return MaterialApp(
          title: 'Book App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // Show HomeScreen if authenticated, otherwise LoginScreen
          home: auth.isAuthenticated ? HomeScreen() : LoginScreen(),
          routes: {
            '/home': (context) => HomeScreen(),
            '/login': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
          },
        );
      },
    );
  }
}
