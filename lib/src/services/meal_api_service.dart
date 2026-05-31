import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/meal_model.dart';

class MealApiService {
  Future<List<Meal>> getMeals() async {
    final response = await http.get(
      Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s="),
    );

    final data = jsonDecode(response.body);

    final List meals = data['meals'];

    return meals.map((e) => Meal.fromJson(e)).toList();
  }
}
