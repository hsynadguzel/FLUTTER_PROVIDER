// ignore_for_file: file_names

class TCMBBilgiAmacliKurlar {
  int? unit;
  String? isim;
  String? currencyName;
  double? exchangeRate;
  String? kod;
  String? currencyCode;

  TCMBBilgiAmacliKurlar(
      {this.unit,
      this.isim,
      this.currencyName,
      this.exchangeRate,
      this.kod,
      this.currencyCode});

  TCMBBilgiAmacliKurlar.fromJson(Map<String, dynamic> json) {
    unit = json['Unit'];
    isim = json['Isim'];
    currencyName = json['CurrencyName'];
    exchangeRate = json['ExchangeRate'];
    kod = json['Kod'];
    currencyCode = json['CurrencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Unit'] = this.unit;
    data['Isim'] = this.isim;
    data['CurrencyName'] = this.currencyName;
    data['ExchangeRate'] = this.exchangeRate;
    data['Kod'] = this.kod;
    data['CurrencyCode'] = this.currencyCode;
    return data;
  }
}
