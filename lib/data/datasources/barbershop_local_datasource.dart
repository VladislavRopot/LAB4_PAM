import '../models/barbershop_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

abstract class BarbershopLocalDataSource {
  Future<List<BarbershopModel>> getBarbershops();
  Future<List<BarbershopModel>> getRecommendedBarbershops();
}

class BarbershopLocalDataSourceImpl implements BarbershopLocalDataSource {
  @override
  Future<List<BarbershopModel>> getBarbershops() async {
    final jsonString = await rootBundle.loadString('assets/barbershops.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => BarbershopModel.fromJson(json)).toList();
  }

  @override
  Future<List<BarbershopModel>> getRecommendedBarbershops() async {
    final allBarbershops = await getBarbershops();
    return allBarbershops.where((b) => b.isRecommended).toList();
  }
}
