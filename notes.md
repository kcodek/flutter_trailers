1. Flutter App (Anatomy) 
    - Scaffold
        - AppBar
        - Container
            - Column
                - Row 
                    - Text
                    - Icon
                - Text
                - Network Image


1. `Scaffold` class -  Implements the basic material design visual layout structure.
1. `Ctrl+.` - options to add code snippets, intellisense

1. Widgets
    - Single Child - e.g. `Container` widget is similar to a div
    - Multi Child 
    - A `stateless` widget never changes. Icon, IconButton, and Text are examples of stateless widgets. Stateless widgets subclass statelessWidget. 
        - To create a Stateless widget, we have to override the `build()` method

    - A `stateful` widget is dynamic: for example, it can change its appearance in response to events triggered by user interactions or when it receives data. Checkbox, Radio, Slider, InkWell, Form, and TextField are examples of stateful widgets. Stateful widgets subclass statefulWidget.
        - To create a Stateful widget, we have to override the `createState()` method, which returns the state of the widget. 


1. MaterialApp Class
    - An application that uses material design. A convenience widget that wraps a number of widgets that are commonly required for material design applications. It builds upon a WidgetsApp by adding material-design specific functionality, such as AnimatedTheme and GridPaper.

1. Forms
    - How do you run a callback function every time the text changes? With Flutter, you have two options:
    1 .Supply an `onChanged()` callback to a `TextField`or a `TextFormField`.
    2. Use a `TextEditingController`.
    3. Remember to `dispose` of the `TextEditingController` when it’s no longer needed. This ensures that you discard any resources used by the object.

1. Routes 
    - In Flutter, screens and pages are called routes.
    - In Android, a route is equivalent to an Activity. In iOS, a route is equivalent to a ViewController. In Flutter, a route is just a widget.
    - Where does the Route come from? You can create your own, or use a `MaterialPageRoute`, which is useful because it transitions to the new route using a platform-specific animation.
    - When using `initialRoute`, don’t define a `home` property.
    - pass arguments to a named route and read the arguments using `ModalRoute.of()` and `onGenerateRoute()` 
    - `ModalRoute.of()` method returns the current route with the arguments.
    - Instead of extracting the arguments directly inside the widget, you can also extract the arguments inside an `onGenerateRoute()` function and pass them to a widget. The `onGenerateRoute()` function creates the correct route based on the given RouteSettings.
    - To connect the two screens together with an animation, wrap the Image widget on both screens in a Hero widget. The Hero widget requires two arguments:
        - `tag`: An object that identifies the `Hero`. It must be the same on both screens.
        - `child`: The widget to animate across screens.
1. Null Safety
    - Try to create non-nullable variables when possible, as these will be guaranteed to be not null at compile time.
    - If you know that a nullable expression won't be null, you can assign it to a non-nullable variable with the `!` operator.

1. Lists
    - Displaying lists of data is a fundamental pattern for mobile apps. Flutter includes the `ListView` widget to make working with lists a breeze

1. JSON Serializable
    - package to auto generate json to &  from dart objects
    - Add the following three lines in the dart file to generate toJson & fomJson methods: 
        ~~~dart
        import 'package:json_annotation/json_annotation.dart';
        part 'note_for_listing.g.dart'; // auto generated file`
        
        // @JsonSerializable(explicitToJson: true) // is needed when there are sub classes that need to be converted to JSON
        @JsonSerializable()
        class NoteForListing{}
        ~~~~
    - using the build_runner, generate the files
        - `$ flutter packages pub run build_runner build  --delete-conflicting-outputs`
        - to generate on the fly, use `watch` instead of `build`
            `$ flutter packages pub run build_runner watch  --delete-conflicting-outputs`
------
1. VSCode tips  for flutter development
    1. shortcuts for templates
        - `stl`: Stateless widget,
        - `stfl`: Stateful widget
        - `initS`: initState
        - `dis`: dispose
        - `listViewB`: ListView.builder

    1. `cmd+.` - to show options like Extract Method, Wrap into a widget,...
    1. `cmd+D` - to add selection, change all instances of text in one shot.
------

1. Dart Basics
 - Supports two compilations   
    - AOT - Ahead of time 
    - JIT - Just in time
 - Hot Reload, Hot Restart   - use statelessWidget, statefulWidget classes

### TODO: 
1. setup Android Studio   
1. resize icons using Android Studio
### commands
~~~sh
    $ flutter doctor -v
    $ flutter --version
    ## To run the Android app
    # 1. create a Emulator using Andriod AVD Manager(e.g. Nexus 7 tablet device)
    # 2. Add the following to ~/coding/flutter_trailers/haplovms/android/local.properties
    # ndk.dir=~/Library/Android/sdk/ndk/23.0.7599858
    $ flutter run
    ############################################
    ## To run the web app
    $ flutter build web
    $ flutter run -d chrome # CORS - images from other sources are not loaded
    $ flutter run -d chrome --web-renderer html # this works
    # to generate a production build
    $ flutter build web --web-renderer html --release 
~~~

### Errors & Exceptions
1.  > What went wrong: Execution failed for task ':app:stripDebugDebugSymbols'.
    > NDK at ~/Library/Android/sdk/ndk-bundle did not have a source.properties file
    - Fix: 
    1. Add the following to `local.properties`
        @ ~/flutter_trailers/haplovms/android/local.properties`
        - `ndk.dir=~/Library/Android/sdk/ndk/23.0.7599858`
### References
1. Flutter
    1. https://github.com/flutter/flutter
    1. https://flutter.dev/docs/reference/flutter-cli
    1. https://pub.dev/packages/get
    1. https://flutter.dev/docs/cookbook
    1. https://flutter.dev/docs/get-started/test-drive
    1. https://www.youtube.com/watch?v=i6gFRSnE6Ro
    1. yes_or_no_app: https://www.youtube.com/watch?v=OYk5Ud7wFGY
    1. https://flutter.dev/docs/development/tools/vs-code
    1. https://public-apis.io/
    1. https://pub.dev/
    1. https://api.flutter.dev/flutter/widgets/Container-class.html
    1. https://api.flutter.dev/flutter/material/MaterialApp-class.html
    1. https://api.flutter.dev/flutter/material/Scaffold-class.html
    1. https://flutter.dev/docs/development/ui/widgets
    1. https://flutter.dev/docs
    1. https://github.com/londonappbrewery/Flutter-Course-Resources
    - Layout
      1. https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e
    - DevTools
        1. https://flutter.dev/docs/development/tools/devtools/inspector
        1. https://dart.dev/tools/dart-devtools


1. Helpers 
    1. Icons
        1. icon generator - https://appicon.co/  
        1. https://icons8.com/
        1. https://www.vecteezy.com/
        1. https://www.canva.com
        1. https://www.materialpalette.com/
    1.  Fonts
        1. https://fonts.google.com/
    1. Sounds 
        1. https://freesound.org/
    1. sample request-response
        1. https://reqres.in/  

1. For android studio setup
    - can't find bundled Java 
    - https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/#what-is-usrlibexecjava-home
    - https://stackoverflow.com/questions/51281702/unable-to-find-bundled-java-version-on-flutter/
         
    ~~~sh
    $ /usr/libexec/java_home
    # /Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home

    $ /usr/libexec/java_home -V

    # Matching Java Virtual Machines (3):
    # 16.0.1 (x86_64) "Oracle Corporation" - "Java SE 16.0.1" /Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home
    # 1.8.301.09 (x86_64) "Oracle Corporation" - "Java" /Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
    # 1.8.0_152 (x86_64) "Oracle Corporation" - "Java SE 8" /Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
    # /Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home


    ### run a specified JDK command.
    $ /usr/libexec/java_home -v1.8
    # /Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home

    ## VSCode
        $ cd /Applications/Android\ Studio.app/Contents/jre
        ln -s ../jre jdk
        ln -s "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" jdk
        flutter doctor -v

    ~~~
1. Design Patterns in Flutter
    1. https://github.com/mkobuolys/flutter-design-patterns
    1. https://medium.com/flutter-community/flutter-design-patterns-10-factory-method-c53ad11d863f    

1. Dart
    1. https://www.youtube.com/watch?v=Ej_Pcr4uC2Q
    1. https://github.com/mahmudahsan/flutter
    1. https://codewithandrea.com/videos/dart-null-safety-ultimate-guide-non-nullable-types/