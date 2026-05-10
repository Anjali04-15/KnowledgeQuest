import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/domain.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_nav.dart';
import 'levels_screen.dart';

class DomainsScreen extends StatelessWidget {
  const DomainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Domain'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('⭐ ${provider.progress.totalPoints}',
                  style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: provider.domains.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, i) {
          final domain = provider.domains[i];
          return _DomainCard(domain: domain, provider: provider);
        },
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

class _DomainCard extends StatelessWidget {
  final Domain domain;
  final AppProvider provider;
  const _DomainCard({required this.domain, required this.provider});

  Color _domainColor(DomainType type, bool isDark) {
    switch (type) {
      case DomainType.ai:
        return isDark ? AppTheme.darkPrimary : AppTheme.lightPrimary;
      case DomainType.cybersecurity:
        return isDark ? const Color(0xFF1A6B3C) : const Color(0xFF1B6B3A);
      case DomainType.aptitude:
        return isDark ? const Color(0xFF8B1A1A) : const Color(0xFF9C2A10);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = provider.isDarkMode;
    final completed = provider.completedLevelsInDomain(domain);
    final total = provider.totalLevelsInDomain(domain);
    final progress = total > 0 ? completed / total : 0.0;
    final color = _domainColor(domain.type, isDark);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LevelsScreen(domain: domain)),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.9), color.withValues(alpha: 0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(domain.icon, style: const TextStyle(fontSize: 36)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(domain.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(domain.description,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.white70, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$completed / $total levels',
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 13)),
                Text('${(progress * 100).toInt()}%',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
