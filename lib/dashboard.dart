import 'package:alyasini_pay/model/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  final int money;
  const Dashboard({this.money});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Saldo>(
        builder: (context) => Saldo(),
        child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/card.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      )
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("N657HUI", style: TextStyle(fontFamily: "Regular", fontSize: 32.0, fontWeight: FontWeight.w600),),
                          SizedBox(height: 10.0,),
                          Text("Muhammad Ilzam Mulkhaq", style: TextStyle(fontFamily: "Regular", fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.grey[500]),),
                        ],
                      ),
                      Container(
                        height: 64.0,
                        width: 64.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/card.png"),
                            fit: BoxFit.cover
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Sisa Saldo : ", style: TextStyle(fontFamily: "Regular", fontSize: 24.0, fontWeight: FontWeight.w600),),
                      Consumer<Saldo>(
                        builder: (context, saldo, _) => Text("${saldo.currentMoney} Points", style: TextStyle(fontFamily: "Regular", fontSize: 24.0, fontWeight: FontWeight.w600),)
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 28.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Pilih Metode", style: TextStyle(fontFamily: "Regular", fontSize: 24.0, fontWeight: FontWeight.w600),),
                    SizedBox(height: 16.0,),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 4.0,
                      children: <Widget>[
                        Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage("https://cdn.dribbble.com/users/226242/screenshots/2756054/wallet.png"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage("https://cdn.dribbble.com/users/478988/screenshots/6636197/reclaiming_bills.jpg"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage("https://cdn.dribbble.com/users/317953/screenshots/2500985/trending-and-influencer-communications.jpg"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}