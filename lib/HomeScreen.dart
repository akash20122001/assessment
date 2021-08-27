import 'package:assessment/ApiFetch.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CryptoApi fetchApi = CryptoApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Assessment - Crypto Prices")),
        body: FutureBuilder(
            future: fetchApi.getCryptoApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(
                              snapshot.data[index].current_price.toString()),
                              trailing: Text('${snapshot.data[index].price_change_percentage_24h.toStringAsFixed(2)}\%'),

                              );
                          
                    });
              }
            }));
  }
}
