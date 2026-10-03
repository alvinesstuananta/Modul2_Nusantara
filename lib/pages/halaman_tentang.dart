import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_city, size: 80, color: Colors.indigo),
              SizedBox(height: 12),
              Text(
                'Nusantara Cerdas Mobile v2.0',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Aplikasi Layanan Terpadu Warga Smart City Kota Nusantara.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
