---
layout: default
---

# Flutter jalaali package
A flutter package to make working with solar date easier. You can convert dates to solar dates and manipulate those by using this package in your application.
## Constructors

There is three constructors for this class:

#### Default constructor

This constructor is used to create specific jalaali date manually:

    new JalaaliDate(1397, 8, 8);

#### `now` constructor

Constructs a `JalaaliDate` instance with current date:

    new JalaaliDate.now();

#### `fromDateTime` constructor

Constructs a `JalaaliDate` instance from a Datetime

    new JalaaliDate.fromDateTime(new DateTime.now());

## Methods
#### `toString`:

Returns a human-readable string for this `JalaaliDate` instance. At least one of parameters must be true

| Param | Type | Default | Description |
|:------|:-----|:----|---|:------------|
| showDate (Optional) | bool | true | show date in returned string |	
| showTime (Optional) | bool | false | show time in returned string |
#### `toDateTime`:
Returns an instance of `DateTime` from this `JalaaliDate`.
#### `format`:
| Param | Type | Description |
|:------|:-----|:------------|
| format (required) | `String` | specifies how returned string should be formatted |
| persianNumbers (Optional) | `bool` | specifies usage of persian numbers like "۵" |

Returns the jalaali date in determined format. You can specify what should this function return by using below table.

| Input | Description | Output Example | 
|:------|:------------|:---------------|
| "YYYY" | jalaali year as a 4 digit number | 1397 |
| "YY" | jalaali year as a 2 digit number | 97 |
| "MMM" | persian name on the month | آبان |
| "MM" | jalaali month as a 2 digit number | 08 |
| "M" | jalaali month number | 8 |
| "DDD" | persian day of the month word | پنجم |
| "DD" | day of the month as a 2 digit number | 05 |
| "D" | day of the month number | 5 |