A tiny command-line newsreader.

Just execute `wnews` and it will give you the three or four 
most important news of the past few days, 
as assembled by Wikipedia editors. (See the _In the news_ section
of [Wikipedia homepage](https://en.wikipedia.org/wiki/Main_Page).)

```terminal
wnews
→ Croatia adopts the euro and also joins the Schengen Area.
  https://en.wikipedia.org/wiki/Croatia_and_the_euro

→ Pope Emeritus Benedict XVI dies at the age of 95.
  https://en.wikipedia.org/wiki/Pope_Benedict_XVI

→ Brazilian footballer Pelé dies at the age of 82.
  https://en.wikipedia.org/wiki/Pel%C3%A9

→ A winter storm causes record-breaking low temperatures and leaves more than 90
  people dead across North America.
  https://en.wikipedia.org/wiki/December_2022_North_American_winter_storm
```


## Installation

Assuming you have `dart` in your PATH, run the following command:

```terminal
dart pub global activate wnews
```

That's it.
Now, you can use `wnews` from anywhere on the command line.


## Development 

To use `wnews` while developing, go to the root directory of the project,
and run

```terminal
dart pub global activate --source path .
```

After this, the executable in `bin/wnews.dart` is accessible
on your `$PATH` by simply typing `wnews` (as if you activated the version
that is on pub.dev).

### TODO