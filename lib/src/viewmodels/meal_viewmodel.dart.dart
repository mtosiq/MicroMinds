// src/viewmodels/meal_viewmodel.dart
import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../services/meal_api_service.dart';

class MealViewModel extends ChangeNotifier {
  final MealApiService service;

  MealViewModel(this.service);

  List<Meal> meals = [];
  bool isLoading = false;

  Future<void> fetchMeals() async {
    isLoading = true;
    notifyListeners();

    meals = await service.getMeals();

    isLoading = false;
    notifyListeners();
  }
}
