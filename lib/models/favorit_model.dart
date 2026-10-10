import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final Set<String> _layananFavorit = {};

  List<String> get daftarFavorit => _layananFavorit.toList();

  bool isFavorit(String namaLayanan) {
    return _layananFavorit.contains(namaLayanan);
  }

  void tandai(String namaLayanan) {
    _layananFavorit.add(namaLayanan);
    notifyListeners();
  }

  void batalTandai(String namaLayanan) {
    _layananFavorit.remove(namaLayanan);
    notifyListeners();
  }

  void toggleFavorit(String namaLayanan) {
    if (_layananFavorit.contains(namaLayanan)) {
      _layananFavorit.remove(namaLayanan);
    } else {
      _layananFavorit.add(namaLayanan);
    }
    notifyListeners();
  }
}
