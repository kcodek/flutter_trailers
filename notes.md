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

1. Dart Basics
 - Supports two compilations   
    - AOT - Ahead of time 
    - JIT - Just in time

### commands
~~~sh
    $ flutter doctor -v
    $ flutter --version
    $ flutter build web
    $ flutter run -d chrome
~~~

### References
1. Flutter
    1. https://github.com/flutter/flutter
    1. https://flutter.dev/docs
    1. https://flutter.dev/docs/reference/flutter-cli
    1. https://pub.dev/packages/get
    1. https://flutter.dev/docs/cookbook
    1. https://flutter.dev/docs/get-started/test-drive
    1. https://www.youtube.com/watch?v=i6gFRSnE6Ro
    1. yes_or_no_app: https://www.youtube.com/watch?v=OYk5Ud7wFGY
    1. https://flutter.dev/docs/development/tools/vs-code
    1. https://public-apis.io/
    1. https://pub.dev/
    

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

    ## Android Studio
            

    ~~~

1. Dart
    1. https://www.youtube.com/watch?v=Ej_Pcr4uC2Q
    1. https://github.com/mahmudahsan/flutter