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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Service Mode",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Transit Service",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new formDropDowns("LTL"),
                new formDropDowns("Select One..")
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(right: 250),
              child: Text(
                "Pickup Services",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new formCheckBoxes("Construction Site",true),
            new formCheckBoxes("Courier Services",false),
            new formCheckBoxes("Drayage Service",false),
            new formCheckBoxes("Dropped Trailer",false),
            new formCheckBoxes("Inside Service",false),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Date Pickup Requested",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Date Pickup Actual",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new formDropDowns("Select Date..."),
                new formDropDowns("Select Date...")
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top : 20),
                  child: MaterialButton(
                      disabledColor: Colors.white,
                      child: Text("Back",style:TextStyle(color: Colors.blue))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top : 20),
                  child: MaterialButton(
                      disabledColor: Colors.black,
                      child: Text("Next",style:TextStyle(color: Colors.white))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container notification1() {
    return Container(
      padding: EdgeInsets.fromLTRB(85, 5, 0, 30),
      child: Row(
        children: <Widget>[
          Text(
            "*",
            style: TextStyle(
              color: Colors.red,
            ),
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
      centerTitle: true,
      title: Container(
        child: Image.asset(
          "assets/images/delivery.png",
        ),
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

class formCheckBoxes extends StatelessWidget {
  final option;
  final selected;
  const formCheckBoxes(this.option,this.selected) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15,2, 0, 0),
        child: Column(children: <Widget>[
           Row(
              children: <Widget>[
                Checkbox(
                  value: selected,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  onChanged: (bool value) {},
                ),
                Text(option,
                    style: TextStyle(color: Colors.black)),
              ],
            ),
        ]));
  }
}

class formDropDowns extends StatelessWidget {
  final buttonName;

  const formDropDowns(this.buttonName) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(4)),
          color: Colors.grey,
        ),
        width: 160.0,
        height: 40.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(buttonName, style: TextStyle(color: Colors.black)),
              items: <String>['Courier 1', 'Courier 2'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ));
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
        Expanded(
          flex: 20,
          child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: new Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 14, 0, 13),
                child: Text(
                  labelName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
        ),
        Expanded(
          flex: 40,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              border: new Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: new TextFormField(
                decoration: new InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
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
