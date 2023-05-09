import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_provider/model/tcmbBilgiAmacliKurlar.dart';

class Services {
  Future<List<TCMBBilgiAmacliKurlar>> fetchData() async {
    List<TCMBBilgiAmacliKurlar> tcmbBilgiAmacliKurlar = [];
    tcmbBilgiAmacliKurlar.clear();
    final response = await http.get(
      Uri.parse('http://hasanadiguzel.com.tr/api/bilgiamackur'),
    );
    Map<String, dynamic> decoded = jsonDecode(response.body);
    for (Map<String, dynamic> jsondata in decoded["TCMB_BilgiAmacliKurlar"]) {
      tcmbBilgiAmacliKurlar.add(TCMBBilgiAmacliKurlar.fromJson(jsondata));
    }
    return tcmbBilgiAmacliKurlar;
  }
}
