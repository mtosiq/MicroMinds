import 'package:flutter/foundation.dart';

class PasswordVisibilityProvider extends ChangeNotifier {
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}

class NutritionProvider extends ChangeNotifier {
  String _selectedGoal = 'Build Muscle';

  String get selectedGoal => _selectedGoal;

  void setGoal(String goal) {
    if (_selectedGoal == goal) return;
    _selectedGoal = goal;
    notifyListeners();
  }
}

class SearchProvider extends ChangeNotifier {
  String _selectedGoal = 'All';
  String _query = '';
  final List<String> _recentSearches = [
    'Chicken pasta',
    'High protein breakfast',
    'Post workout meal',
  ];

  String get selectedGoal => _selectedGoal;
  String get query => _query;
  List<String> get recentSearches => List.unmodifiable(_recentSearches);

  void setGoal(String goal) {
    if (_selectedGoal == goal) return;
    _selectedGoal = goal;
    notifyListeners();
  }

  void performSearch(String query) {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) return;

    _query = trimmedQuery;
    _recentSearches.remove(trimmedQuery);
    _recentSearches.insert(0, trimmedQuery);
    notifyListeners();
  }

  void clearRecentSearches() {
    if (_recentSearches.isEmpty) return;
    _recentSearches.clear();
    notifyListeners();
  }
}
