import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetailLayanan extends StatefulWidget {
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
  State<HalamanDetailLayanan> createState() => _HalamanDetailLayananState();
}

class _HalamanDetailLayananState extends State<HalamanDetailLayanan> {
  bool _isSending = false; // State lokal untuk status proses pengiriman

  void _ajukanPermohonan() async {
    setState(() {
      _isSending = true; // Tampilkan indikator proses
    });

    // 1. Simpan/tambahkan data ke Provider terlebih dahulu sebelum delay
    context.read<PengajuanModel>().tambahPengajuan(widget.namaLayanan);

    // 2. Simulasi delay pengiriman singkat
    await Future.delayed(const Duration(seconds: 1));

    // 3. Pastikan widget masih aktif sebelum mengakses context/setState kembali
    if (!mounted) return;

    setState(() {
      _isSending = false;
    });

    // 4. Pop dan kirim pesan balik
    Navigator.pop(
      context,
      'Layanan "${widget.namaLayanan}" berhasil ditambahkan ke keranjang pengajuan!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.namaLayanan)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.namaLayanan,
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
                widget.dinas,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time, color: Colors.indigo),
              title: const Text('Jam Operasional'),
              subtitle: Text(
                widget.jamOperasional,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Keterangan Layanan:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              widget.keterangan,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isSending ? null : () => Navigator.pop(context),
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
                    onPressed: _isSending ? null : _ajukanPermohonan,
                    child: _isSending
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Ajukan Permohonan'),
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
