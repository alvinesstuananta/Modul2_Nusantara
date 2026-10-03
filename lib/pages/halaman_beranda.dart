import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  final List<Map<String, dynamic>> _pilarSmartCity = const [
    {
      'nama': 'Smart Governance',
      'icon': Icons.gavel,
      'desc': 'Pelayanan publik transparan & efisien',
    },
    {
      'nama': 'Smart Economy',
      'icon': Icons.monetization_on,
      'desc': 'Kewirausahaan & daya saing ekonomi',
    },
    {
      'nama': 'Smart People',
      'icon': Icons.people,
      'desc': 'Pendidikan & SDM berkualitas',
    },
    {
      'nama': 'Smart Mobility',
      'icon': Icons.directions_bus,
      'desc': 'Transportasi ramah lingkungan',
    },
    {
      'nama': 'Smart Environment',
      'icon': Icons.park,
      'desc': 'Pengelolaan lingkungan berkelanjutan',
    },
    {
      'nama': 'Smart Living',
      'icon': Icons.health_and_safety,
      'desc': 'Kualitas hidup & kesehatan terjamin',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang di Nusantara Cerdas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Aplikasi terpadu layanan warga Kota Nusantara.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '6 Pilar Smart City',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Perbaikan typo nama kelas di sini
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _pilarSmartCity.length,
          itemBuilder: (context, index) {
            final pilar = _pilarSmartCity[index];
            return Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      pilar['icon'] as IconData,
                      size: 36,
                      color: Colors.indigo,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      pilar['nama'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pilar['desc'] as String,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
