import 'package:flutter/material.dart';

import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<String> _judul = const [
    'Beranda Smart City',
    'Layanan Publik',
    'Profil Warga & Laporan',
  ];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lebar = MediaQuery.of(context).size.width;
    final bool layarLebar = lebar >= 600;

    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksTerpilih]), elevation: 2),
      drawer: _buatDrawer(),
      body: layarLebar ? _tataLetakLebar() : _halaman[_indeksTerpilih],
      bottomNavigationBar: layarLebar ? null : _buatBilahBawah(),
    );
  }

  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view),
          label: 'Layanan',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Warga',
        ),
      ],
    );
  }

  Widget _tataLetakLebar() {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Icon(Icons.location_city, size: 36, color: Colors.indigo),
          ),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(Icons.grid_view),
              label: Text('Layanan'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Warga'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _halaman[_indeksTerpilih]),
      ],
    );
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        if (indeks < 3) {
          _pilihTujuan(indeks);
          Navigator.pop(context);
        }
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Alvin Estu Ananta'),
          accountEmail: Text('warga.nusantara@smartcity.go.id'),
          currentAccountPicture: CircleAvatar(
            child: Icon(Icons.account_circle, size: 48),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view),
          label: Text('Layanan'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Warga'),
        ),
        const Divider(indent: 28, endIndent: 28),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Pengaturan Kota'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.pengaturan);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.tentang);
          },
        ),
        ListTile(
          leading: const Icon(Icons.error_outline, color: Colors.orange),
          title: const Text('Uji Route Salah'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/route-invalid-test');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text('Keluar', style: TextStyle(color: Colors.red)),
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
