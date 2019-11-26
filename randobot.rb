#!/usr/bin/env ruby
puts "Welcome to randobot 7000"

class Randobot
  attr_reader :people

  def initialize
    @default_list = [:astrid, :blair, :kurtis, :kadir, :humberto, :ian,  :paul, :reece, :richard, :ross, :rushil, :anthony, :jade]
    p load_last_known_people
    if !load_last_known_people.empty?
      @people = load_last_known_people.clone
    else
      @people = @default_list.clone
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
    File.open("./people.txt", "r").each do |line|
      people.push line.strip
    end

    people
  end
end

def pressed_quit user_input
  user_input.include? 'q'
end

randobot = Randobot.new

user_input = ''

randobot.load_last_known_people

while (!pressed_quit user_input)
  person = randobot.next_person
  secondPerson = randobot.next_person
  personStatement = 'And the winner is......' + person.to_s + ' and ' + secondPerson.to_s

  puts personStatement
  puts "remaining: " + randobot.people.to_s
  `say "#{personStatement}"`

  user_input = gets
end

randobot.save
