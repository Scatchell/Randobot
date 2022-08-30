# Randobot 9000

## Initial setup

Version of ruby this script has been tested on is: ruby 2.7.0

Install required dependencies with:

`bundle install`

## Run instructions

First, update the original people list in the code to indicate ALL current names you want to randomly select from. e.g. `people = [:name1, :name2, :name3, ...]`

Then, run using:

`ruby ./randobot.rb <people text file> <number of people to select>`

or, if your ruby env is set up correctly, you can omit the ruby command

`/randobot.rb <people text file> <number of people to select>`

At the end of the run the names will be spoken. If you hit `q` and enter to exit, the currently selected names will be removed from the list and the choice will be saved. If you don't like the choice, you can exit with `ctrl + c` instead, and the changes will **NOT** be saved.

### Examples

`./randobot.rb peoplelist1.txt 2` - select 2 people, recording the remaining list in the existing peoplelist1.txt file, and recording the most recent selection of two people in people-last-selected-peoplelist1.txt

`./randobot.rb adifferentlist.txt 1` - select 1 person randomly, recording the remaining list in the existing adifferentlist.txt file, and recording the most recent selection of a single name in people-last-selected-adifferentlist.txt

### Argument details

#### People text file

This has to be an existing file on your computer. Start with an empty file on the first run.

As the application is run, it will record the remaining names in this file. It can be edited manually, but must retain the format of all names on separate line, separated by new line:

```
name1
name2
name3
```

#### Number of people to select

This argument indicates how many people will be randomly selected.

**Note:** it only supports options 1 or 2 - you cannot select three people.
