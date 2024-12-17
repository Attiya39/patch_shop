// To parse this JSON data, do
//
//     final getAllCategoriesResponseModel = getAllCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

List<String> getAllCategoriesResponseModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String getAllCategoriesResponseModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
