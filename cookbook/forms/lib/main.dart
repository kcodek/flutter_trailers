import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const MyCustomForm(),
        ));
  }
}

//Define a custom Form widget
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

//Define a corresponding State class
// This class holds data related to the form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<_MyCustomFormState>.
  // or you can use the Form.of() method to access the form within nested widgets.
  final _formKey = GlobalKey<FormState>();

  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final myController = TextEditingController();

  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myFocusNode;

  //need a function to run every time the text changes.
  void _printLatestValue() {
    print('First text field: ${myController.text}');
  }

  // Begin listening for changes when the _MyCustomFormState class is initialized,
  // and stop listening when the _MyCustomFormState is disposed.

  @override
  void initState() {
    super.initState();
    //start listening to changes
    myController.addListener(_printLatestValue);
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Add TextFormFields and ElevatedButton here
          TextFormField(
            autofocus: true,
            // Supply the TextEditingController to either a TextField or a TextFormField.
            // Once you wire these two classes together,
            // you can begin listening for changes to the text field.
            controller: myController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              focusNode: myFocusNode,
              // autofocus: false,
              // controller: myController,
              onChanged: (text) {
                print('Search field: $text');
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(32),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController
                          content: Text(myController.text),
                        );
                      });
                },
                tooltip: 'Show me the value',
                child: const Icon(Icons.text_fields),
              )),
          Padding(
            padding: const EdgeInsets.all(32),
            child: FloatingActionButton(
              // When the button is pressed,
              // give focus to the text field using myFocusNode.
              onPressed: () => myFocusNode.requestFocus(),
              tooltip: 'Focus Second Text Field',
              child: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
