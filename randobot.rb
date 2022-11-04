#!/usr/bin/env ruby

require 'HTTParty' 
require 'json'


class Randobot
  attr_reader :people

  def initialize(people_file)
    @default_list = [:sara, :paula, :eduardo, :anthony, :joel, :pow, :douglas, :jose, :david, :sharath]
    @people_file = people_file

    last_known_people = load_last_known_people
    if last_known_people.empty?
      @people = @default_list.clone
    else
      @people = last_known_people.clone
    end
  end

  def next_person
    person = @people.sample
    @people.delete(person)

    if @people.size == 0
      @people = @default_list.clone
    end

    person
  end

  def save
    File.open(@people_file, "w") do |file|
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

def pressed_quit(user_input)
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


def person_statement_for(people)
  if people.length == 2
    person_statement = "And the winner is......" + people.first.to_s + " and " + people[1].to_s
  else
    person_statement = "And the winner is......" + people.first.to_s
  end

  person_statement
end

def results_to_chat(person_statement)
  uri = ENV['GCHAT_URI']

  headers = { 'Content-Type' => 'application/json; charset=UTF-8' }

  request_body = '{ text : "' + person_statement + '" }'
  options = { :body => request_body, :headers => headers }

  res = HTTParty.post(uri, options)
end

def save_selected_people(people_selected)
  File.open("./people-last-selected-" + $people_file.gsub(/\\\//, ""), "w") do |file|
    people_selected.each do |person|
      file.puts person
    end
  end
end

people = []
until pressed_quit user_input
  if num_of_people == 2
    people = [randobot.next_person, randobot.next_person]
  else
    people = [randobot.next_person]
  end

  person_statement = person_statement_for people

  puts person_statement
  puts "remaining: " + randobot.people.to_s
  `say "#{person_statement}"`
  user_input = STDIN.gets
end

randobot.save
save_selected_people people
# results_to_chat personStatement
