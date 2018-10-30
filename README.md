# Flutter jalaali package
A flutter package to make working with solar date easier. You can convert dates to solar dates and manipulate those by using this package in your app.

## Cunstructors
There is three cunstructors for this class:
#### Default constructor
This constructor is used to create specific jalaali date manually:
    new JalaaliDate(1397, 8, 8);
#### `now` constructor
Constructs a `JalaaliDate` instance with current date:
    new JalaaliDate.now();
#### `fromDateTime` constructor
Constructs a `JalaaliDate` instance from a datetime
    new JalaaliDate.fromDateTime(new DateTime.now());