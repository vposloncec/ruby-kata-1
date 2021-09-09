# Ruby Kata - Part 1: Library

Start specs with `rspec spec`

## Usage

`./bin/run` to see commands available

#### Commands
 * `./bin/run books [isbn]` -- retrieve all or add optional parameter isbn to find one
 * `./bin/run magazines [isbn]` -- retrieve all or add optional parameter isbn to find one
 * `./bin/run authors` 
 * `./bin/run publications [--sort_by_title]` -- retrieve both books and magazines 


## About

First I started off with the idea to create the app using [off the rails active record](https://github.com/jhollinger/otr-activerecord).
While implementing it, I ran into a db setup issue which took a lot of my time, I had problems integrating rspec into otr-ar.

After about an hour I realized it is something that would take a long to debug.
Current implementation was an aftermath of starting from scratch, just creating models and parser which can read CSVs.
