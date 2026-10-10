import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        ),
        const SizedBox(height: 8),
        const Center(
          child: Text(
            'Alvin Estu Ananta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text(
            'NIK: 6472012903000001 | Sektor 3 Nusantara',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),

        // --- BAGIAN KERANJANG PENGAJUAN (Provider) ---
        Text(
          'Keranjang Pengajuan Layanan',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Consumer<PengajuanModel>(
          builder: (context, pengajuan, child) {
            if (pengajuan.daftarPengajuan.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Belum ada layanan yang dimasukkan ke keranjang pengajuan.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }
            return Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan Siap Diajukan (${pengajuan.totalPengajuan}):',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    ...pengajuan.daftarPengajuan.map((l) => Text('• $l')),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {
                          pengajuan.kosongkanPengajuan();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Keranjang pengajuan dikosongkan'),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 18,
                        ),
                        label: const Text(
                          'Kosongkan',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 16),

        // --- BAGIAN LAYANAN FAVORIT (Consumer<FavoritModel>) ---
        Text(
          'Layanan Favorit Saya',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Consumer<FavoritModel>(
          builder: (context, favorit, child) {
            if (favorit.daftarFavorit.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Belum ada layanan favorit. Tandai bintang pada menu Layanan.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }
            return Column(
              children: favorit.daftarFavorit.map((nama) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.star, color: Colors.amber),
                    title: Text(nama),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () => favorit.batalTandai(nama),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),

        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.history_edu, color: Colors.indigo),
            title: const Text('Riwayat Laporan & Pengaduan'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
          ),
        ),
      ],
    );
  }
}
