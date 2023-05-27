class Model {
  dynamic infected;
  dynamic tested;
  dynamic recovered;
  dynamic deceased;
  String? country;
  String? moreData;
  String? historyData;
  String? sourceUrl;
  String? lastUpdatedApify;

  Model(
      {required this.infected,
      required this.tested,
      required this.recovered,
      required this.deceased,
      required this.country,
      required this.moreData,
      required this.historyData,
      required this.sourceUrl,
      required this.lastUpdatedApify});

  factory Model.fromJson({required Map<String, dynamic> json}) {
    return Model(
        infected: json['infected'],
        tested: json['tested'],
        recovered: json['recovered'],
        deceased: json['deceased'],
        country: json['country'],
        moreData: json['moreData'],
        historyData: json['historyData'],
        sourceUrl: json['sourceUrl'],
        lastUpdatedApify: json['lastUpdatedApify']);
  }

  /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['infected'] = this.infected;
    data['tested'] = this.tested;
    data['recovered'] = this.recovered;
    data['deceased'] = this.deceased;
    data['country'] = this.country;
    data['moreData'] = this.moreData;
    data['historyData'] = this.historyData;
    data['sourceUrl'] = this.sourceUrl;
    data['lastUpdatedApify'] = this.lastUpdatedApify;
    return data;
  }*/
}
