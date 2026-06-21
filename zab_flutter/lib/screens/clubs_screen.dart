import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../widgets/glass_card.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: DemoData.clubs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final club = DemoData.clubs[index];
          return GlassCard(
            padding: const EdgeInsets.all(24),
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(club.emoji, style: const TextStyle(fontSize: 30)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(club.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(height: 6),
                      Text(
                        club.description,
                        style: TextStyle(fontSize: 13.5, color: Colors.white.withOpacity(0.6), height: 1.5),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${club.members} members',
                        style: TextStyle(fontSize: 12.5, color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
