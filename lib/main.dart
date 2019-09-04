import 'package:flutter/material.dart';

void main() => runApp(StatelessForm());

class StatelessForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Form App",
      home: StatefullForm(),
      theme: ThemeData.light(),
    );
    ;
  }
}

class StatefullForm extends StatefulWidget {
  _FlutterForm createState() => _FlutterForm();
}

class _FlutterForm extends State<StatefullForm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _formAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            headerContainer(),
            formProgress(),
            notification1(),
            textInputWidget("Shipper", "Company Name"),
            textInputWidget("Location", "Address"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: textInputWidget("BOL #", "Optional"),
            ),
          ],
        ),
      ),
    );
  }

  Container notification1() {
    return Container(
      padding: EdgeInsets.fromLTRB(80, 5, 0, 30),
      child: Row(
        children: <Widget>[
          Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "Indicates Required Field",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Padding formProgress() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          FormPageNoIndication(Colors.black, Colors.white, "1"),
          Expanded(child: Divider()),
          FormPageNoIndication(Colors.white30, Colors.grey, "2"),
          Expanded(child: Divider()),
          FormPageNoIndication(Colors.white30, Colors.grey, "3"),
          Expanded(child: Divider()),
          FormPageNoIndication(Colors.white30, Colors.grey, "4"),
          Expanded(child: Divider()),
          FormPageNoIndication(Colors.white30, Colors.grey, "5"),
          Expanded(child: Divider()),
          FormPageNoIndication(Colors.white30, Colors.grey, "6"),
        ],
      ),
    );
  }

  Container headerContainer() {
    return Container(
      color: Color.fromRGBO(225, 225, 225, 0.7),
      width: double.infinity,
      alignment: Alignment(-1, 0),
      padding: EdgeInsets.fromLTRB(20, 15, 0, 12),
      child: Column(children: <Widget>[
        Text(
          "Create Shipment",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Step 1 of 6 - Shipper",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ]),
    );
  }

  AppBar _formAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      title: Container(
        child: Image.asset(
          "assets/images/delivery.png",
        ),
        margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
      ),
      actions: <Widget>[
        CircleAvatar(
          radius: 15,
          child: ClipOval(
            child: Image.asset("assets/images/elonMusk.jpg"),
          ),
        ),
        Icon(Icons.arrow_drop_down)
      ],
    );
  }
}

class textInputWidget extends StatelessWidget {

  final labelName;

  final hintText;

  const textInputWidget(this.labelName, this.hintText) : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            width: 90,
            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              border: new Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 14, 0, 13),
              child: Text(
                labelName, style: TextStyle(fontWeight: FontWeight.bold),),
            )
        ),
        Container(
          width: 200,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            border: new Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: new TextFormField(
            decoration: new InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class FormPageNoIndication extends StatelessWidget {
  var bgColor;

  var txtColor;
  var text;

  FormPageNoIndication(this.bgColor, this.txtColor, this.text) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: txtColor),
        ));
  }
}
