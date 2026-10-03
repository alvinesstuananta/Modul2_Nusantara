import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.indigo,
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'Perizinan'),
              Tab(icon: Icon(Icons.local_hospital), text: 'Kesehatan'),
              Tab(icon: Icon(Icons.commute), text: 'Transportasi'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buatDaftarLayanan([
                  {
                    'namaLayanan': 'Izin Usaha Mikro & Kecil (IUMK)',
                    'dinas': 'Dinas Penanaman Modal & PTSP',
                    'jamOperasional': '08.00 - 15.00 WIB',
                    'keterangan': 'Penerbitan legalitas usaha skala mikro dan kecil bagi warga Nusantara.',
                  },
                  {
                    'namaLayanan': 'Izin Mendirikan Bangunan (PBG)',
                    'dinas': 'Dinas Pekerjaan Umum & Perumahan',
                    'jamOperasional': '08.30 - 14.30 WIB',
                    'keterangan': 'Permohonan persetujuan bangunan gedung baru maupun renovasi.',
                  },
                  {
                    'namaLayanan': 'Izin Keramaian & Acara Publik',
                    'dinas': 'Dinas Perhubungan & Satpol PP',
                    'jamOperasional': '08.00 - 16.00 WIB',
                    'keterangan': 'Izin penyelenggaraan kegiatan publik yang menggunakan fasilitas umum.',
                  },
                ]),
                _buatDaftarLayanan([
                  {
                    'namaLayanan': 'Pendaftaran Faskes / Puskesmas',
                    'dinas': 'Dinas Kesehatan Kota Nusantara',
                    'jamOperasional': '24 Jam (UGD) / 07.30 - 14.00 WIB',
                    'keterangan': 'Antrean online pendaftaran pasien di Puskesmas terdekat.',
                  },
                  {
                    'namaLayanan': 'Layanan Ambulans Gawat Darurat',
                    'dinas': 'Dinas Kesehatan & Call Center 112',
                    'jamOperasional': '24 Jam Siaga',
                    'keterangan': 'Permintaan armada ambulans darurat gratis wilayah Nusantara.',
                  },
                  {
                    'namaLayanan': 'Permohonan Donor Darah PMI',
                    'dinas': 'PMI & Dinas Kesehatan',
                    'jamOperasional': '08.00 - 20.00 WIB',
                    'keterangan': 'Pengajuan kebutuhan stok darah atau pendaftaran donor darah mandiri.',
                  },
                ]),
                _buatDaftarLayanan([
                  {
                    'namaLayanan': 'Kartu Langganan Trans Nusantara',
                    'dinas': 'Dinas Perhubungan',
                    'jamOperasional': '06.00 - 21.00 WIB',
                    'keterangan': 'Pendaftaran kartu subsidi transportasi umum bagi pelajar & lansia.',
                  },
                  {
                    'namaLayanan': 'Uji Kelaikan Kendaraan (KIR)',
                    'dinas': 'Dinas Perhubungan',
                    'jamOperasional': '08.00 - 14.00 WIB',
                    'keterangan': 'Pendaftaran pemeriksaan berkala kelaikan jalan kendaraan umum/barang.',
                  },
                  {
                    'namaLayanan': 'Laporan Kendala Rute Bus Rapid',
                    'dinas': 'Dinas Perhubungan & BRT Manager',
                    'jamOperasional': '24 Jam (Online)',
                    'keterangan': 'Pengaduan kelambatan rute atau fasilitas halte transportasi publik.',
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buatDaftarLayanan(List<Map<String, String>> dataLayanan) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: dataLayanan.length,
      itemBuilder: (itemContext, index) {
        final item = dataLayanan[index];
        return Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.touch_app, color: Colors.indigo),
            title: Text(
              item['namaLayanan']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item['dinas']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final hasil = await Navigator.pushNamed(
                itemContext,
                AppRoutes.detailLayanan,
                arguments: item,
              );

              if (hasil != null && itemContext.mounted) {
                ScaffoldMessenger.of(itemContext).showSnackBar(
                  SnackBar(
                    content: Text(hasil.toString()),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
