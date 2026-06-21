import '../models/models.dart';

class DemoData {
  static final List<Mood> moods = [
    Mood(key: 'relaxed', label: 'Relaxed', emoji: '😌'),
    Mood(key: 'stressed', label: 'Stressed', emoji: '😟'),
    Mood(key: 'sleepy', label: 'Sleepy', emoji: '😴'),
    Mood(key: 'focus', label: 'Need Focus', emoji: '⚡'),
    Mood(key: 'motivation', label: 'Need Motivation', emoji: '❤️'),
    Mood(key: 'talk', label: 'Need Someone to Talk To', emoji: '🤝'),
    Mood(key: 'goal', label: 'Working Towards a Goal', emoji: '🎯'),
  ];

  static final Map<String, List<String>> moodRecommendations = {
    'relaxed': ['Light ambient meditation', 'Nature soundscape', 'Gratitude journaling prompt'],
    'stressed': ['3-minute breathing reset', 'Guided body scan', 'Talk to your tutor'],
    'sleepy': ['Delta sleep music', 'Sleep story: Quiet Harbor', 'Wind-down breathing'],
    'focus': ['Binaural focus session', 'Pomodoro breathing', 'Morning Routine Club'],
    'motivation': ['AI pep talk', 'Goal-setting session with tutor', 'Entrepreneurs Circle'],
    'talk': ['Message your tutor', 'Emotional Support Community', 'AI companion chat'],
    'goal': ['Accountability check-in', 'Personal Growth Club', 'Weekly progress journal'],
  };

  static final List<Session> sessions = [
    Session(id: 's1', title: 'Morning Calm', type: 'Meditation', duration: '10 min', tier: 'free', cover: '🌅'),
    Session(id: 's2', title: 'Deep Focus Flow', type: 'Binaural', duration: '25 min', tier: 'pro', cover: '⚡'),
    Session(id: 's3', title: 'Quiet Harbor', type: 'Sleep Story', duration: '18 min', tier: 'sleep', cover: '🌙'),
    Session(id: 's4', title: 'Box Breathing', type: 'Breathing', duration: '4 min', tier: 'free', cover: '🫁'),
    Session(id: 's5', title: 'Theta Drift', type: 'Sleep Music', duration: '45 min', tier: 'sleep', cover: '✨'),
    Session(id: 's6', title: 'Letting Go', type: 'Meditation', duration: '15 min', tier: 'pro', cover: '🍃'),
  ];

  static final List<Club> clubs = [
    Club(id: 'c1', name: 'Meditation Circle', emoji: '🧘', members: 4210, description: 'Daily guided sits and silent sessions, beginners welcome.'),
    Club(id: 'c2', name: 'Morning Routine Club', emoji: '🌅', members: 2870, description: 'Build a calm, consistent start to your day with others.'),
    Club(id: 'c3', name: 'Reading Club', emoji: '📚', members: 1530, description: 'Monthly picks on mindfulness, psychology, and growth.'),
    Club(id: 'c4', name: 'Fitness & Wellness', emoji: '💪', members: 3360, description: 'Movement as medicine — gentle challenges, shared wins.'),
    Club(id: 'c5', name: 'Creative Minds', emoji: '🎨', members: 980, description: 'Art, journaling, and expression as a wellbeing practice.'),
  ];

  static final List<Tutor> tutors = [
    Tutor(id: 't1', name: 'Aisha Nakato', specialty: 'Stress & Anxiety', rating: 4.9, sessions: 412, avatarColor: '#D946A8', bio: 'Certified mindfulness coach focused on practical stress tools for busy professionals.'),
    Tutor(id: 't2', name: 'Daniel Kintu', specialty: 'Sleep Coaching', rating: 4.8, sessions: 298, avatarColor: '#8B5CF6', bio: 'Helps clients rebuild healthy sleep routines using CBT-I informed techniques.'),
  ];

  static final List<Project> projects = [
    Project(id: 'p1', title: 'Build a Community Garden', emoji: '🌳', goal: 4000000, raised: 2350000, currency: 'UGX', backers: 184, timeline: '8 weeks', description: 'A shared green space for a Kampala neighborhood to grow food and gather.'),
    Project(id: 'p2', title: 'Books for 200 Children', emoji: '📚', goal: 6000000, raised: 4120000, currency: 'UGX', backers: 261, timeline: '4 weeks', description: 'Stock a school library with age-appropriate books across subjects.'),
  ];
}
