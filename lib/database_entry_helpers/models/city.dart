// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class City extends Equatable {
  const City({
    required this.id,
    required this.governorate_id,
    required this.city_name_en,
    required this.city_name_ar,
  });

  factory City.fromJson(dynamic json) {
    return City(
      id: json['id'] as String,
      governorate_id: json['governorate_id'] as String,
      city_name_en: json['city_name_en'] as String,
      city_name_ar: json['city_name_ar'] as String,
    );
  }
  final String id;
  final String governorate_id;
  final String city_name_en;
  final String city_name_ar;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'governorate_id': governorate_id,
      'city_name_en': city_name_en,
      'city_name_ar': city_name_ar,
    };
  }

  static List<City> cities(List<dynamic> json) {
    return json.map(City.fromJson).toList();
  }

  @override
  List<Object?> get props => [
        id,
        governorate_id,
        city_name_en,
        city_name_ar,
      ];
}
