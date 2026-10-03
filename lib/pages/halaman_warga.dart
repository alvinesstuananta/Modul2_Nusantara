import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: CircleAvatar(radius: 45, child: Icon(Icons.person, size: 45)),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'Alvin Estu Ananta',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text(
            'NIK: 6472012903000001 | Sektor 3 Nusantara',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 24),
        Card(
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.history_edu, color: Colors.indigo),
            title: const Text('Riwayat Laporan & Pengaduan'),
            subtitle: const Text(
              'Lihat status laporan aktivitas warga yang dikirim',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.riwayatLaporan);
            },
          ),
        ),
      ],
    );
  }
}
