import 'package:flutter/material.dart';

class HalamanDetailLayanan extends StatelessWidget {
  const HalamanDetailLayanan({
    super.key,
    required this.namaLayanan,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
  });

  final String namaLayanan;
  final String dinas;
  final String jamOperasional;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(namaLayanan)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaLayanan,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const Divider(height: 24),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.account_balance, color: Colors.indigo),
              title: const Text('Penanggung Jawab'),
              subtitle: Text(
                dinas,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time, color: Colors.indigo),
              title: const Text('Jam Operasional'),
              subtitle: Text(
                jamOperasional,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Keterangan Layanan:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(keterangan, style: const TextStyle(fontSize: 14, height: 1.4)),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        'Permohonan "$namaLayanan" berhasil diajukan!',
                      );
                    },
                    child: const Text('Ajukan Permohonan'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
