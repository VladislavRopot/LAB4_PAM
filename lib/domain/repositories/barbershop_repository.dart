import '../entities/barbershop.dart';

abstract class BarbershopRepository {
  Future<List<Barbershop>> getBarbershops();
  Future<List<Barbershop>> getRecommendedBarbershops();
}
