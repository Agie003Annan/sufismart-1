import 'package:flutter/material.dart';

class EmptyView extends StatefulWidget {

  @override
  _EmptyViewState createState() => _EmptyViewState();
}


class _EmptyViewState extends State<EmptyView> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            //Image.asset("assets/images/image_default.png", width: 200),
            Text(
              "Tidak ada data",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Tidak ada data untuk ditampilkan",
              style: TextStyle(
                  color: Colors.grey,
                  height: 1.5
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}