# Ruby Kata - Part 1: Library

Start specs with `rspec spec`

## Usage

`./bin/run` to see commands available

#### Printing all csv data
 * `run books` -- isbn optional parameter to find by
 * `run magazines` -- isbn optional parameter to find by
 * `run authors` 


## About

First I started off with the idea to create the app using [off the rails active record](https://github.com/jhollinger/otr-activerecord).
While implementing it, I ran into a db setup issue which took a lot of my time, I had problems integrating rspec into otr-ar.

After about an hour I realized it is something that would take a long to debug.
Current implementation was an aftermath of starting from scratch, just creating models and parser which can read CSVs.
