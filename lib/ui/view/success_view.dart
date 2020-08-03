import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatefulWidget{ 
  String msg;
  SuccessView({Key key, @required this.msg}) : super(key: key);
_SuccessViewState createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView>{ 
     @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("", style: TextStyle(color: Colors.green),),
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.green,),
              onPressed: () => Navigator.of(context).pop(),
            )
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Image.asset("assets/images/success.png", width: 300),
                    SizedBox(height: 20,),
                    Text(
                      "Success",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      widget.msg,
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.5
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30,),
                    RaisedButton(
                      color: Colors.green,
                      disabledColor: Color(0xffcccccc),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Text("Ya",
                        style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

}