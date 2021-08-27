import 'package:http/http.dart' as http;
import 'dart:convert';



class CryptoApi {
  List<CoinModel> coinsList = [];
  String uri =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h";
  Future<List<CoinModel>> getCryptoApi() async {
    var response = await http.get(Uri.parse(uri));
    var jsonData = json.decode(response.body);

    for (var c in jsonData) {
      CoinModel coin = CoinModel(
        name: c["name"],
        image: c["image"],
         price_change_percentage_24h: c["price_change_percentage_24h"],
        current_price: c["current_price"],
      );
      coinsList.add(coin);
    }
    return coinsList;
  }
}

class CoinModel {
  final String name;
  final current_price;
  final String image;
  final double price_change_percentage_24h;

  CoinModel(
      {required this.name, required this.current_price, required this.image,required this.price_change_percentage_24h});
}
