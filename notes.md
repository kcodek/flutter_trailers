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
    - A `stateless` widget never changes. Icon, IconButton, and Text are examples of stateless widgets. Stateless widgets subclass StatelessWidget. A `stateful` widget is dynamic: for example, it can change its appearance in response to events triggered by user interactions or when it receives data. Checkbox, Radio, Slider, InkWell, Form, and TextField are examples of stateful widgets. Stateful widgets subclass StatefulWidget.

1. MaterialApp Class
    - An application that uses material design. A convenience widget that wraps a number of widgets that are commonly required for material design applications. It builds upon a WidgetsApp by adding material-design specific functionality, such as AnimatedTheme and GridPaper.

1. Forms
    - How do you run a callback function every time the text changes? With Flutter, you have two options:
    1 .Supply an `onChanged()` callback to a `TextField`or a `TextFormField`.
    2. Use a `TextEditingController`.
    3. Remember to `dispose` of the `TextEditingController` when it’s no longer needed. This ensures that you discard any resources used by the object.
------

1. Dart Basics
 - Supports two compilations   
    - AOT - Ahead of time 
    - JIT - Just in time
 - Hot Reload, Hot Restart   - use StatelessWidget, StatefulWidget classes

### TODO: 
1. setup Android Studio   
1. resize icons using Android Studio
### commands
~~~sh
    $ flutter doctor -v
    $ flutter --version
    ## To run the Android app
    # 1. create a Emulator using Andriod AVD Manager(e.g. Nexus 7 tablet device)
    # 2. Add the following to /Users/kishored/coding/flutter_trailers/haplovms/android/local.properties
    # ndk.dir=/Users/kishored/Library/Android/sdk/ndk/23.0.7599858
    $ flutter run
    ############################################
    ## To run the web app
    $ flutter build web
    $ flutter run -d chrome # CORS - images from other sources are not loaded
    $ flutter run -d chrome --web-renderer html # this works
    # to generate a production build
    $ flutter build web --web-renderer html --release 
~~~

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

1. Dart
    1. https://www.youtube.com/watch?v=Ej_Pcr4uC2Q
    1. https://github.com/mahmudahsan/flutter