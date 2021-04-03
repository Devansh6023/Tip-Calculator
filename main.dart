import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip-Calculator',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String _controller = '';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Tip-Calculator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 30),
              controller: controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: ('\$500'),
                  labelText: ('Enter Amount'),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                  suffixIcon: Icon(Icons.calculate),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Next'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page2(title: controller),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  TextEditingController title = TextEditingController();
  Page2({Key key, this.title}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController percent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Tip-Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Amount Entered',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.title.text,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: percent,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: ('e.g.- 15%'),
                        labelText: ('Tip in %'),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.calculate),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Total Amount"),
                      content: Text(
                          'Amount: ${double.parse(widget.title.text)}\n'
                          'Tip: ${double.parse(percent.text) * 0.01 * double.parse(widget.title.text)}\n'
                          'Total Amount: ${double.parse(widget.title.text) + double.parse(percent.text) * 0.01 * double.parse(widget.title.text)}'),
                      actions: [
                        new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Done'))
                      ],
                    );
                  });
            },
            child: Text('Enter'),
            textColor: Colors.black,
            // onPressed: calculateTip,
          ),
        ],
      ),
    );
  }
}
