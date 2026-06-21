class Mood {
  final String key;
  final String label;
  final String emoji;

  Mood({required this.key, required this.label, required this.emoji});
}

class Session {
  final String id;
  final String title;
  final String type;
  final String duration;
  final String tier;
  final String cover;

  Session({
    required this.id,
    required this.title,
    required this.type,
    required this.duration,
    required this.tier,
    required this.cover,
  });
}

class Club {
  final String id;
  final String name;
  final String emoji;
  final int members;
  final String description;

  Club({
    required this.id,
    required this.name,
    required this.emoji,
    required this.members,
    required this.description,
  });
}

class Tutor {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final int sessions;
  final String avatarColor;
  final String bio;

  Tutor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.sessions,
    required this.avatarColor,
    required this.bio,
  });
}

class Project {
  final String id;
  final String title;
  final String emoji;
  final int goal;
  final int raised;
  final String currency;
  final int backers;
  final String timeline;
  final String description;

  Project({
    required this.id,
    required this.title,
    required this.emoji,
    required this.goal,
    required this.raised,
    required this.currency,
    required this.backers,
    required this.timeline,
    required this.description,
  });
}
