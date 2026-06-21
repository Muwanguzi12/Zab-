import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../widgets/glass_card.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sessions', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: DemoData.sessions.length,
        itemBuilder: (context, index) {
          final session = DemoData.sessions[index];
          return GlassCard(
            padding: const EdgeInsets.all(20),
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(session.cover, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 14),
                Text(
                  session.title,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${session.type} · ${session.duration}',
                  style: TextStyle(fontSize: 12.5, color: Colors.white.withOpacity(0.6)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
