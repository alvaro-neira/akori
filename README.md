# akori
Akori Images Detector

Java Section
============

Compile (OS X/ Unix Like)
=========================

```sh
$ cd akori/src
$ javac -classpath ".:../lib/selenium-server-standalone-2.47.1.jar:../lib/jsoup-1.7.3.jar:../build/classes" -d ../build/classes com/codeborne/selenide/*.java com/codeborne/selenide/impl/*.java com/codeborne/selenide/ex/*.java cl/akori/main/GetCsv.java
```

Run
===

```sh
$ cd akori
$ java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" cl.akori.main.GetCsv "<page relative URL>"
$ java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" cl.akori.main.GetImage "<page relative URL>"
```
