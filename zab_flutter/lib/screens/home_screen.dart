import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../data/demo_data.dart';
import '../widgets/glass_card.dart';
import '../theme/app_theme.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  String? _selectedMood;
  late AnimationController _breatheController;

  @override
  void initState() {
    super.initState();
    _breatheController = AnimationController(
      duration: const Duration(milliseconds: 5500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breatheController.dispose();
    super.dispose();
  }

  String _getGreeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final user = auth.currentUser;
    final firstName = user?.name.split(' ')[0];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Text(
                'RELAX · CONNECT · GROW · TOGETHER',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 18),
              Text(
                firstName != null
                    ? '${_getGreeting()},\n$firstName'
                    : 'A wellness ecosystem,\nnot just an app',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 22),
              Text(
                "ZAB blends AI guidance, real human tutors, and communities who care — so you don't just listen, you connect, learn, and grow alongside other people.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppTheme.auroraGradient,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.violet500.withOpacity(0.25),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to sessions or auth
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(user != null ? 'Start a session' : 'Begin your journey', style: const TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Mood Check-in
              GlassCard(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    // Breathing Orb
                    AnimatedBuilder(
                      animation: _breatheController,
                      builder: (context, child) {
                        final scale = 0.88 + (_breatheController.value * 0.18);
                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppTheme.auroraGradient,
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.violet500.withOpacity(0.35 + (_breatheController.value * 0.15)),
                                  blurRadius: 40 + (_breatheController.value * 30),
                                  spreadRadius: _breatheController.value * 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    Text('Take a deep breath.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.ink400)),
                    const SizedBox(height: 8),
                    Text('How are you feeling today?', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 22),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: DemoData.moods.map((m) {
                        final isSelected = _selectedMood == m.key;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMood = m.key;
                            });
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: isSelected ? null : Colors.white.withOpacity(0.04),
                              gradient: isSelected ? AppTheme.auroraGradient : null,
                              border: Border.all(
                                color: isSelected ? Colors.transparent : Colors.white.withOpacity(0.14),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(m.emoji, style: const TextStyle(fontSize: 16)),
                                const SizedBox(width: 6),
                                Text(m.label, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Recommendations
              if (_selectedMood != null) ...[
                Text('FOR HOW YOU\'RE FEELING', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 10),
                Text('Recommended for you right now', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 24),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: DemoData.moodRecommendations[_selectedMood]?.length ?? 0,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final rec = DemoData.moodRecommendations[_selectedMood]![index];
                    return GlassCard(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              gradient: AppTheme.auroraGradient,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(rec, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 56),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
