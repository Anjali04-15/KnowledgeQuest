import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/domain.dart';
import '../widgets/app_bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final theme = Theme.of(context);
    final progress = provider.progress;

    final bestScore = progress.completedLevels.isEmpty
        ? 0
        : progress.completedLevels.values
            .map((r) => (r.score / r.totalQuestions * 100).round())
            .reduce((a, b) => a > b ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(
                provider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: provider.toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Avatar & name
            Center(
              child: CircleAvatar(
                radius: 44,
                backgroundColor:
                    theme.colorScheme.primary.withValues(alpha: 0.15),
                child: Text(
                  progress.username.isNotEmpty
                      ? progress.username[0].toUpperCase()
                      : 'Q',
                  style: TextStyle(
                      fontSize: 36,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () => _editUsername(context, provider),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(progress.username,
                        style: theme.textTheme.headlineMedium),
                    const SizedBox(width: 6),
                    Icon(Icons.edit,
                        size: 18, color: theme.colorScheme.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text('Knowledge Quester',
                  style: theme.textTheme.bodyMedium),
            ),
            const SizedBox(height: 24),

            // Stats
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    icon: '⭐',
                    label: 'Total Points',
                    value: '${progress.totalPoints}',
                    highlight: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatTile(
                    icon: '🔥',
                    label: 'Streak',
                    value: '${progress.currentStreak} days',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    icon: '🏆',
                    label: 'Levels Done',
                    value: '${progress.completedLevels.length}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatTile(
                    icon: '🎯',
                    label: 'Best Score',
                    value: '$bestScore%',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Activity Heatmap
            Text('Activity', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            _ActivityHeatmap(heatmapData: progress.heatmapData),
            const SizedBox(height: 24),

            // Domain Progress
            Text('Domain Progress', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            ...provider.domains.map(
              (domain) =>
                  _DomainProgressCard(domain: domain, provider: provider),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }

  void _editUsername(BuildContext context, AppProvider provider) {
    final controller =
        TextEditingController(text: provider.progress.username);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Username'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter username'),
          autofocus: true,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                provider.updateUsername(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// ── Heatmap ───────────────────────────────────────────────────────────────────

class _ActivityHeatmap extends StatelessWidget {
  final Map<DateTime, int> heatmapData;
  const _ActivityHeatmap({required this.heatmapData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    const totalWeeks = 10;
    final rawStart =
        todayDate.subtract(const Duration(days: totalWeeks * 7 - 1));
    final alignedStart =
        rawStart.subtract(Duration(days: rawStart.weekday - 1));

    final weeks = <List<DateTime?>>[];
    DateTime cursor = alignedStart;
    for (int w = 0; w < totalWeeks; w++) {
      final week = <DateTime?>[];
      for (int d = 0; d < 7; d++) {
        final day = cursor.add(Duration(days: d));
        week.add(day.isAfter(todayDate) ? null : day);
      }
      weeks.add(week);
      cursor = cursor.add(const Duration(days: 7));
    }

    final dayLabels = ['M', '', 'W', '', 'F', '', 'S'];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              const labelWidth = 14.0;
              const gap = 3.0;
              const totalGaps = (totalWeeks - 1) * gap;
              final rawCellSize =
                  (constraints.maxWidth - labelWidth - gap - totalGaps) /
                      totalWeeks;
              // Cap at 18px so cells don't blow up on wide/laptop screens
              final cellSize = rawCellSize.clamp(0.0, 18.0);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Day labels column
                  SizedBox(
                    width: labelWidth,
                    child: Column(
                      children: List.generate(7, (i) => SizedBox(
                        height: cellSize + (i < 6 ? gap : 0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            dayLabels[i],
                            style: TextStyle(
                              fontSize: 8,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(width: gap),
                  // Week columns — fixed size, left-aligned
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: weeks.asMap().entries.map((entry) {
                      final wIdx = entry.key;
                      final week = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(
                            right: wIdx < totalWeeks - 1 ? gap : 0),
                        child: Column(
                          children: List.generate(7, (dayIndex) {
                            final day = week[dayIndex];
                            final isEmpty = day == null;
                            final count =
                                isEmpty ? 0 : heatmapData[day] ?? 0;
                            final opacity = isEmpty
                                ? 0.0
                                : count == 0
                                    ? 0.08
                                    : count == 1
                                        ? 0.35
                                        : count == 2
                                            ? 0.6
                                            : 0.9;
                            final isToday = day == todayDate;
                            return Tooltip(
                              message: isEmpty
                                  ? ''
                                  : count == 0
                                      ? 'No activity'
                                      : '$count quiz${count > 1 ? 'zes' : ''}',
                              child: Container(
                                width: cellSize,
                                height: cellSize,
                                margin: EdgeInsets.only(
                                    bottom: dayIndex < 6 ? gap : 0),
                                decoration: BoxDecoration(
                                  color: isEmpty
                                      ? Colors.transparent
                                      : primary.withValues(alpha: opacity),
                                  borderRadius: BorderRadius.circular(3),
                                  border: isToday
                                      ? Border.all(
                                          color: primary, width: 1.5)
                                      : null,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Less',
                  style: TextStyle(
                      fontSize: 10,
                      color: theme.textTheme.bodyMedium?.color)),
              const SizedBox(width: 4),
              ...List.generate(4, (i) {
                final opacity = [0.08, 0.35, 0.6, 0.9][i];
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: opacity),
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }),
              const SizedBox(width: 4),
              Text('More',
                  style: TextStyle(
                      fontSize: 10,
                      color: theme.textTheme.bodyMedium?.color)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _StatTile extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final bool highlight;
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlight
            ? theme.colorScheme.primary.withValues(alpha: 0.15)
            : theme.cardTheme.color,
        borderRadius: BorderRadius.circular(14),
        border: highlight
            ? Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.4))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(value,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          Text(label, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _DomainProgressCard extends StatelessWidget {
  final Domain domain;
  final AppProvider provider;
  const _DomainProgressCard({required this.domain, required this.provider});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completed = provider.completedLevelsInDomain(domain);
    final total = provider.totalLevelsInDomain(domain);
    final progress = total > 0 ? completed / total : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(domain.icon, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 10),
              Expanded(
                child:
                    Text(domain.name, style: theme.textTheme.titleMedium),
              ),
              Text('$completed/$total',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: theme.colorScheme.surface,
              valueColor:
                  AlwaysStoppedAnimation(theme.colorScheme.primary),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
