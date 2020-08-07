import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sufismart/ui/view/login_view.dart';

class NologinView extends StatefulWidget{
  _NologinViewState createState() => _NologinViewState();
}

class _NologinViewState extends State<NologinView>{
  @override
  Widget build(BuildContext context) {    
    return Scaffold( 
      body: Center(
        child: Container(          
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/not_login.png", width: 300),
              SizedBox(
                height: 20,
              ),
              Text(
                "Anda belum login",
                style: TextStyle(
                    color: Hexcolor("#0d306b"),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Silahkan login terlebih dahulu",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                buttonColor: Hexcolor("#0d306b"),
                minWidth: MediaQuery.of(context).size.width - 100,
                child: RaisedButton(
                  disabledColor: Color(0xffcccccc),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}