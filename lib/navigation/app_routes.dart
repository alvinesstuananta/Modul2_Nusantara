import 'package:flutter/material.dart';

import 'kerangka_navigasi.dart';
import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_riwayat_laporan.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_tentang.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      riwayatLaporan: (context) => const HalamanRiwayatLaporan(),
      pengaturan: (context) => const HalamanPengaturan(),
      tentang: (context) => const HalamanTentang(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailLayanan) {
      final args = settings.arguments as Map<String, String>? ?? {};
      return MaterialPageRoute(
        builder: (context) => HalamanDetailLayanan(
          namaLayanan: args['namaLayanan'] ?? 'Layanan',
          dinas: args['dinas'] ?? 'Dinas Terkait',
          jamOperasional: args['jamOperasional'] ?? '08.00 - 15.00 WIB',
          keterangan: args['keterangan'] ?? 'Tidak ada keterangan.',
        ),
      );
    }
    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Route Tidak Dikenal')),
        body: Center(child: Text('Route "${settings.name}" tidak ditemukan.')),
      ),
    );
  }
}
