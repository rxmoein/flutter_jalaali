# Flutter jalaali package
A flutter package to make working with solar date easier. You can convert dates to solar dates and manipulate those by using this package in your app.

## How to use?

    import  'package:jalaali/jalaali.dart';
    
    JalaaliDate.now() // Current solar date
    
    DateTime dt = new DateTime.now();
    JalaaliDate.fromDateTime(dt) // Convert datetime to solar date
