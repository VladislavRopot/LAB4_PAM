import 'package:flutter/material.dart';
import '../../domain/entities/barbershop.dart';
import '../../domain/usecases/get_barbershops.dart';

class BarbershopProvider with ChangeNotifier {
  final GetBarbershops getBarbershopsUseCase;
  final GetRecommendedBarbershops getRecommendedBarbershopsUseCase;

  List<Barbershop> barbershops = [];
  List<Barbershop> recommendedBarbershops = [];
  bool isLoading = false;

  BarbershopProvider({
    required this.getBarbershopsUseCase,
    required this.getRecommendedBarbershopsUseCase,
  });

  Future<void> fetchBarbershops() async {
    isLoading = true;
    notifyListeners();

    barbershops = await getBarbershopsUseCase.execute();
    recommendedBarbershops = await getRecommendedBarbershopsUseCase.execute();

    isLoading = false;
    notifyListeners();
  }
}
