import 'package:flutter/material.dart';
import 'package:laboratorul2/data/datasources/barbershop_local_datasource.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/barber_home_page.dart';
import 'data/repositories/barbershop_repository_impl.dart';
import 'domain/usecases/get_barbershops.dart';
import 'presentation/providers/barbershop_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final barbershopLocalDataSource = BarbershopLocalDataSourceImpl();
            final barbershopRepository = BarbershopRepositoryImpl(
                localDataSource: barbershopLocalDataSource);
            final getBarbershopsUseCase = GetBarbershops(barbershopRepository);
            final getRecommendedBarbershopsUseCase =
                GetRecommendedBarbershops(barbershopRepository);

            return BarbershopProvider(
              getBarbershopsUseCase: getBarbershopsUseCase,
              getRecommendedBarbershopsUseCase:
                  getRecommendedBarbershopsUseCase,
            );
          },
        ),
      ],
      child: BarberApp(),
    ),
  );
}

class BarberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber App',
      debugShowCheckedModeBanner: false,
      home: BarberHomePage(),
    );
  }
}
