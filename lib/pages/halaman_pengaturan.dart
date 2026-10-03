import 'package:flutter/material.dart';

class HalamanPengaturan extends StatelessWidget {
  const HalamanPengaturan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifikasi Peringatan Dini'),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa Antarmuka'),
            subtitle: Text('Bahasa Indonesia'),
          ),
        ],
      ),
    );
  }
}
