import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'dart:convert';
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  int currentBTCPrice = 0;
  int currentETHPrice = 0;
  int currentLTCPrice = 0;

  String currency = 'AUD';

  String urlBTC = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC';
  String urlETH = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/ETH';
  String urlLTC = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/LTC';

  Future<void> getCryptoPrice(int index) async {
    var decodedDataBTC, decodedDataETH, decodedDataLTC;
    currency = currenciesList[index];
    http.Response responceBTC = await http.get('$urlBTC$currency');
    http.Response responceETH = await http.get('$urlETH$currency');
    http.Response responceLTC = await http.get('$urlLTC$currency');

    if (responceBTC.statusCode == 200) {
      String dataBTC = responceBTC.body;
      decodedDataBTC = jsonDecode(dataBTC);

      String dataETH = responceETH.body;
      decodedDataETH = jsonDecode(dataETH);

      String dataLTC = responceLTC.body;
      decodedDataLTC = jsonDecode(dataLTC);
    }
    //print(decodedData['last'].toString());
    currentBTCPrice = decodedDataBTC['last'].toInt();
    currentETHPrice = decodedDataETH['last'].toInt();
    currentLTCPrice = decodedDataLTC['last'].toInt();
  }

  CupertinoPicker getCupertino() {
    List<Widget> dropDownMenuItem = [];
    for (String cur in currenciesList) {
      dropDownMenuItem.add(Text(cur));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlueAccent,
      itemExtent: 40.0,
      onSelectedItemChanged: (index) {
        print(index);
        //int index = SelectedIndex;
        setState(() {
          getCryptoPrice(index);
          print('x:$currentBTCPrice');
        });
      },
      children: dropDownMenuItem,
    );
  }

  DropdownButton<String> getDropDownAndroid() {
    List<DropdownMenuItem<String>> dropDownMenuItem = [];
    for (String cur in currenciesList) {
      print(cur);
      var newItem = DropdownMenuItem(
        child: Text(cur),
        value: cur,
      );
      dropDownMenuItem.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownMenuItem,
      onChanged: (value) {
        print(selectedCurrency);

        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getCryptoPrice(0);
      //print('x:$currentPrice');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //BTC Ticker
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $currentBTCPrice $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          //ETH Ticker
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $currentETHPrice $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          //LTC ticker
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $currentLTCPrice $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: !Platform.isIOS ? getCupertino() : getDropDownAndroid(),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//               value: selectedCurrency,
//               items: dropDownItemList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedCurrency = value;
//                 });
//                 print(selectedCurrency);
//               },
//             )
