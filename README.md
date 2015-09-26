# akori
Akori Images Detector

Compile
=======

```sh
$ cd akori/src
$ javac -classpath ".:../lib/selenium-server-standalone-2.47.1.jar:../lib/jsoup-1.7.3.jar" -d ../build/classes com/codeborne/selenide/*.java com/codeborne/selenide/impl/*.java com/codeborne/selenide/ex/*.java akori/DrawLevel.java
```

Run
===

```sh
$ cd akori
$ java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" akori.DrawLevel
```

