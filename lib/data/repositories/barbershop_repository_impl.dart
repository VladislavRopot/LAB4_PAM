import 'package:laboratorul2/data/datasources/barbershop_local_datasource.dart';

import '../../domain/entities/barbershop.dart';
import '../../domain/repositories/barbershop_repository.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final BarbershopLocalDataSource localDataSource;

  BarbershopRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Barbershop>> getBarbershops() async {
    return await localDataSource.getBarbershops();
  }

  @override
  Future<List<Barbershop>> getRecommendedBarbershops() async {
    return await localDataSource.getRecommendedBarbershops();
  }
}
