import '../entities/barbershop.dart';
import '../repositories/barbershop_repository.dart';

class GetBarbershops {
  final BarbershopRepository repository;

  GetBarbershops(this.repository);

  Future<List<Barbershop>> execute() async {
    return await repository.getBarbershops();
  }
}

class GetRecommendedBarbershops {
  final BarbershopRepository repository;

  GetRecommendedBarbershops(this.repository);

  Future<List<Barbershop>> execute() async {
    return await repository.getRecommendedBarbershops();
  }
}
