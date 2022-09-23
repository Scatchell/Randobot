#!/usr/bin/env ruby

require 'HTTParty' 
require 'json'


class Randobot
  attr_reader :people

  def initialize people_file
    @default_list = [:sara, :paula, :eduardo, :anthony, :joel, :pow, :douglas, :jose, :david, :sharath]
    @people_file = people_file

    p load_last_known_people
    if load_last_known_people.empty?
      @people = @default_list.clone
    else
      @people = load_last_known_people.clone
    end
  end

  def next_person
    person = @people.sample
    @people.delete(person)

    if (@people.size == 0)
      @people = @default_list.clone
    end

    person
  end

  def save
    File.open("./people.txt", "w") do |file|
      @people.each do |person|
        file.puts person
      end
    end
  end

  def load_last_known_people
    people = []
    File.open(@people_file, "r").each do |line|
      people.push line.strip
    end

    people
  end
end

def pressed_quit user_input
  user_input.include? 'q'
end

if ARGV.length < 2
  puts "Too few arguments, please add a people txt file and a number of people to select"
  puts "e.g. ./randobot.rb people.txt 2"
  exit
end

$people_file = ARGV[0]
num_of_people = ARGV[1].to_i

puts "Welcome to randobot 9000"

randobot = Randobot.new($people_file)

user_input = ''

randobot.load_last_known_people

def single_person randobot
  person = randobot.next_person
  personStatement = "And the winner is......" + person.to_s
end

def two_people randobot
  person = randobot.next_person
  secondPerson = randobot.next_person
  personStatement = "And the winner is......" + person.to_s + " and " + secondPerson.to_s
end

def results_to_chat personStatement
  uri = ENV['GCHAT_URI']

  headers = { 'Content-Type' => 'application/json; charset=UTF-8' }

  request_body = '{ text : "' + personStatement + '" }'
  options = {:body => request_body, :headers => headers}

  res = HTTParty.post(uri, options)
end

def save_selected_people people_selected
  File.open("./people-last-selected-" + $people_file.gsub(/\\\//, "") + ".txt", "w") do |file|
    file.puts people_selected
  end
end

while (!pressed_quit user_input)
  if num_of_people == 2
    personStatement = two_people randobot
  else
    personStatement = single_person randobot
  end

  puts personStatement
  puts "remaining: " + randobot.people.to_s
  `say "#{personStatement}"`
  user_input = STDIN.gets
end

randobot.save
save_selected_people personStatement
# results_to_chat personStatement
