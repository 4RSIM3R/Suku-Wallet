import 'dart:convert';

import 'package:alyasini_pay/dashboard.dart';
import 'package:alyasini_pay/model/parser.dart';
import 'package:alyasini_pay/model/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:http/http.dart' as http;
import 'package:simple_permissions/simple_permissions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String hasil = "Scan";
  int money = 0;

  Future<String> scanQr() async {
      return QRCodeReader()
          .setForceAutoFocus(true) // default false
          .setTorchEnabled(true) // default false
          .setHandlePermissions(true) // default true
          .setExecuteAfterPermissionGranted(true) // default true
          .scan();
  }

  Future<Parser> getFromApi(String params) async {
    final response = await http.get("https://api.myjson.com/bins/$params");
    if (response.statusCode == 200) {
        //Klo Di Accept
        var data = json.decode(response.body);
        Parser result = Parser.fromJson(data);
        return result;
    }
  }

  void contoh() async {
    String scan = await scanQr();
    Parser fromApi = await getFromApi(scan);
    //await Future.delayed(Duration(seconds: 3));
    setState(() {
      hasil = "Tunggu";
      money = fromApi.saldo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder:(context) => Saldo(),
        child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pay.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 8.0,),
              Text("Suku Wallet", style: TextStyle(fontSize: 24.0, fontFamily: "Regular",fontWeight: FontWeight.w600),),
              SizedBox(height: 8.0,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0
                ),
                child: Text("Hai, selamat datang di suku wallet untuk ber transaksi silahkan scan kartu anda terlebih dahulu", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontFamily: "Regular",fontWeight: FontWeight.w500),),
              ),
               SizedBox(height: 12.0,),
               Consumer<Saldo>(
                  builder: (context, saldo, _) => GestureDetector(
                   onTap: (){
                    contoh();
                    Future.delayed(Duration(seconds: 4));
                    saldo.currentMoney = money;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Dashboard(
                        money: money,
                      )
                    ));
                   },
                   child: Container(
                     width: 160.0,
                     height: 40.0,
                     decoration: BoxDecoration(
                       color: Colors.blueAccent[200],
                       borderRadius: BorderRadius.circular(5.0)
                     ),
                     child: Center(
                       child: Text(hasil, style: TextStyle(fontFamily: "Regular", fontSize: 18.0, color: Colors.white),),
                     ),
                   ),
                 ),
               )
            ],
          ),
        )
      ),
    );
  }
}