import 'package:flutter/material.dart';

class HalamanRiwayatLaporan extends StatelessWidget {
  const HalamanRiwayatLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan Warga')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.report_problem, color: Colors.amber),
              title: Text('Laporan Lampu Jalan Padam'),
              subtitle: Text('Status: Dalam Proses oleh Dinas Perkim'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Pengajuan Suplesi Air Bersih'),
              subtitle: Text('Status: Selesai ditangani'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Formulir Tambah Laporan Baru Ditampilkan'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
            const SizedBox(width: 40),
            IconButton(icon: const Icon(Icons.sort), onPressed: () {}),
            IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
