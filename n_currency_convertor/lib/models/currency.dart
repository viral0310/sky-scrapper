class Currency {
  final String base;
  // final String pkr;
  // final String gbp;
  // final String eur;
  // final String inr;
  final Map rates;

  Currency(
      {required this.base,
      // required this.pkr,
      // required this.gbp,
      // required this.eur,
      // required this.inr,
      required this.rates});
  factory Currency.fromJson({required Map<String, dynamic> json}) {
    return Currency(
      base: json["base"],
      // pkr: json["rates"]["PKR"],
      // gbp: json["rates"]["GBP"],
      // eur: json["rates"]["EUR"],
      // inr: json["rates"]["INR"],
      rates: Map.from(json["rates"]).map(
        (key, value) => MapEntry(key, value),
      ),
      /*  rates: json["rates"],*/
    );
  }
}

/*
{
"date": "2022-09-22 00:00:00+00",
"base": "USD",
"rates": {
"PKR": "239.91401481708957",
"GBP": "0.88848",
"EUR": "1.01729",
"INR": "80.05100000000024"
}
}*/
