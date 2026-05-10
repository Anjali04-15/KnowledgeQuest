import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/domains_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final provider = AppProvider();
  await provider.init();
  runApp(
    ChangeNotifierProvider.value(
      value: provider,
      child: const KnowledgeQuestApp(),
    ),
  );
}

class KnowledgeQuestApp extends StatelessWidget {
  const KnowledgeQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppProvider>().isDarkMode;
    return MaterialApp(
      title: 'Knowledge Quest',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/domains': (_) => const DomainsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
    );
  }
}
