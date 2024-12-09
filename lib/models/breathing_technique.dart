// models/breathing_technique.dart
class BreathingTechnique {
  final String id;
  final String title;
  final String description;
  bool isMain; // True if this technique is currently the main card.
  String
      buttonText; // Text to display on the button (changes based on card status).
  final String image;

  BreathingTechnique({
    required this.image,
    required this.id,
    required this.title,
    required this.description,
    this.isMain = false,
    String buttonText = 'Learn more', // Default button text for non-main cards.
  }) : buttonText = isMain ? 'Set timing' : buttonText;
}
