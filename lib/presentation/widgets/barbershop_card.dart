import 'package:flutter/material.dart';
import '../../domain/entities/barbershop.dart';

class BarbershopCard extends StatelessWidget {
  final Barbershop barbershop;

  const BarbershopCard({Key? key, required this.barbershop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(barbershop.imageUrl),
          radius: 30,
        ),
        title: Text(
          barbershop.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(barbershop.distance),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(barbershop.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
