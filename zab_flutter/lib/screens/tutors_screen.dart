import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../widgets/glass_card.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutors', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: DemoData.tutors.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final tutor = DemoData.tutors[index];
          // Basic hex parsing, fallback to primary if invalid
          Color avatarBg = Theme.of(context).colorScheme.primary;
          try {
             avatarBg = Color(int.parse(tutor.avatarColor.replaceFirst('#', '0xFF')));
          } catch (_) {}

          return GlassCard(
            padding: const EdgeInsets.all(24),
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: avatarBg,
                  child: Text(
                    tutor.name[0],
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tutor.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(tutor.specialty, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 13.5)),
                      const SizedBox(height: 8),
                      Text(
                        tutor.bio,
                        style: TextStyle(fontSize: 13.5, color: Colors.white.withOpacity(0.6), height: 1.5),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('${tutor.rating} (${tutor.sessions} sessions)', style: const TextStyle(fontSize: 12.5)),
                        ],
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
