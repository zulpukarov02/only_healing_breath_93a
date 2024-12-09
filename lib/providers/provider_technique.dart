import 'package:flutter/material.dart';
import '../models/breathing_technique.dart';

class TechniqueProvider with ChangeNotifier {
  List<BreathingTechnique> techniques = [
    BreathingTechnique(
        id: '1',
        title: 'Breathe Mindfully',
        description:
            "Set your own breathing rhythm and enhance your well-being. Tap 'Play' to begin your practice.",
        isMain: true,
        buttonText: 'Set timing',
        image: 'assets/images/blue.png'),
    BreathingTechnique(
        id: '2',
        title: 'Belly Breathing',
        description: 'Deep belly breaths for relaxation.',
        image: 'assets/images/green.png'),
    BreathingTechnique(
        id: '3',
        title: '4-7-8 Breathing',
        description: 'Calm the mind, prepare for sleep.',
        image: 'assets/images/red.png'),
    BreathingTechnique(
        id: '4',
        title: 'Alternate Nostril Breathing',
        description: 'Energy with nostril alternation.',
        image: 'assets/images/purple.png'),
    BreathingTechnique(
        id: '5',
        title: 'Box Breathing',
        description: 'Balanced breathing in four counts.',
        image: 'assets/images/teal.png'),
  ];

  // Get the current main technique
  BreathingTechnique get mainTechnique {
    return techniques.firstWhere((tech) => tech.isMain,
        orElse: () => techniques[0]);
  }

  // Get techniques excluding the main technique
  List<BreathingTechnique> get displayTechniques {
    return techniques.where((tech) => !tech.isMain).toList();
  }

  // Swap technique and update state
  void swapTechnique(String id) {
    var newMainTech = techniques.firstWhere((tech) => tech.id == id,
        orElse: () => techniques[0]);
    if (!newMainTech.isMain) {
      var currentMainTech = techniques.firstWhere((tech) => tech.isMain,
          orElse: () => techniques[0]);
      currentMainTech.isMain = false;
      currentMainTech.buttonText = 'Learn more';

      newMainTech.isMain = true;
      newMainTech.buttonText = 'Set timing';

      notifyListeners();
    }
  }
}
