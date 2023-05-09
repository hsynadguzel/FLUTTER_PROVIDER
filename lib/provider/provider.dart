import 'package:flutter/material.dart';
import 'package:flutter_provider/model/tcmbBilgiAmacliKurlar.dart';
import 'package:flutter_provider/service/service.dart';

class TCMBBilgiAmacliKurlarProvider with ChangeNotifier {
  List<TCMBBilgiAmacliKurlar> _tcmbBilgiAmacliKurlar = [];
  Services service = Services();

  List<TCMBBilgiAmacliKurlar>? get tcbmBilgiAmacliKurlar =>
      _tcmbBilgiAmacliKurlar;

  fetchData() async {
    _tcmbBilgiAmacliKurlar.clear();
    _tcmbBilgiAmacliKurlar = await service.fetchData();
    notifyListeners();
  }
}
