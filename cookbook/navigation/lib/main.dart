import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Start the app with the "/" named route.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstRoute(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondRoute(),
        //3. Register the widget in the routes table
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
        HeroRoute.routeName: (context) => const HeroRoute(),
        // PassArgumentsScreen.routeName: (context) =>
        //     const PassArgumentsScreen(title: title, message: message),
      },
      // Provide a function to handle named routes.
      // Use it to identify the named route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == PassArgumentsScreen.routeName) {
          // Cast the arguments to the correct type: ScreenArguments.
          final args = settings.arguments as ScreenArguments;

          // Then, extract the required data from the arguments
          // and pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        // The code only supports PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we add them.
        // The assertion here will help remind us of that higher up in the call stack,
        // since this assertion would otherwise fire somewhere in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      // home: const FirstRoute(),
    );
  }
}

// FirstRoute is homescreen here
class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Launch second screen'),
              onPressed: () {
                // Navigate to second route when tapped.
                // Navigate to a new screen by creating a new route and pushing it to the Navigator.
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const SecondRoute()));
                Navigator.pushNamed(context, '/second');
              },
            ),
            ElevatedButton(
              child: const Text('Navigate to screen that extracts arguments'),
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and provide the arguments as an optional
                // parameter. // 4. Navigate to the widget
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // When the user taps the button, navigate
                // to a named route and provide the arguments
                // as an optional parameter.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
              child: const Text('Navigate to a named that accepts arguments'),
            ),
            const SelectionButton(),

            // #TODO
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, HeroRoute.routeName);
            //     },
            //     child: const HeroRoute())
            // // const HeroApp(),
          ],
        ),
      ),
    );
  }
}

// 2. Create a widget that extracts the arguments & displays them
class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

// A Widget that accepts the necessary arguments via the constructor.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor
  // parameters. It does not extract the arguments from
  // the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute
  // function provided to the MaterialApp widget.
  const PassArgumentsScreen({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

// 1. Define the arguments you need to pass
// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pop here with "Yep"...
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, 'Yep!');
                },
                child: const Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pop here with "Nope"...
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: const Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimationMainScreen extends StatelessWidget {
  const AnimationMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AnimationDetailScreen();
          }));
        },
        child: Image.network(
          'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}

class AnimationDetailScreen extends StatelessWidget {
  const AnimationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}

class HeroApp extends StatelessWidget {
  const HeroApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Transition Demo',
      home: AnimationMainScreen(),
    );
  }
}

class HeroRoute extends StatelessWidget {
  const HeroRoute({Key? key}) : super(key: key);
  static const routeName = '/heroApp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const HeroApp(),
        ),
      ),
    );
  }
}
