import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/barbershop_provider.dart';
import '../widgets/barbershop_card.dart';
import '../widgets/recommended_barbershop_card.dart';

class BarberHomePage extends StatefulWidget {
  @override
  _BarberHomePageState createState() => _BarberHomePageState();
}

class _BarberHomePageState extends State<BarberHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BarbershopProvider>(context, listen: false).fetchBarbershops();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BarbershopProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey[600]),
            SizedBox(width: 8),
            Text(
              "Ciocana",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/fotop.png"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    "Ropot Vladislav",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Banner section (reuse your existing code)
                  // ...
                  SizedBox(height: 16),
                  // Search section (reuse your existing code)
                  // ...
                  SizedBox(height: 16),
                  // Nearest Barbershop title
                  Text(
                    "Nearest Barbershop",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // List of barbershops
                  Expanded(
                    child: ListView(
                      children: [
                        // Nearest barbershops
                        ...provider.barbershops
                            .where((b) => !b.isRecommended)
                            .map((barbershop) =>
                                BarbershopCard(barbershop: barbershop))
                            .toList(),
                        // Most recommended section
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Most recommended",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text("See All"),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Recommended barbershops
                        ...provider.recommendedBarbershops
                            .map((barbershop) => RecommendedBarbershopCard(
                                barbershop: barbershop))
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
