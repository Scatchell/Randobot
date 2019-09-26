#!/Users/ascatche/.rvm/rubies/ruby-2.1.2/bin/ruby
puts "Welcome to randobot 7000"

class Randobot
  def initialize
    @default_list = [:astrid, :blair, :bonnie, :george, :humberto, :ian,  :paul, :reece, :richard, :ross, :rushil, :anthony]
    @people = original_list
  end

  def original_list
    @default_list.clone
  end

  def next_person
    person = @people.sample
    @people.delete(person)
    p @people
    if (@people.size == 0)
      @people = original_list
    end

    person
  end

  def save
    File.open("./persons.txt", "w") do |file|
      @people.each do |person|
        file.puts person
      end
    end
  end

end

def pressed_quit user_input
  user_input.include? 'q'
end

randobot = Randobot.new

user_input = ''

while (!pressed_quit user_input)
  person = randobot.next_person
  secondPerson = randobot.next_person
  personStatement = person.to_s + ' and ' + secondPerson.to_s
  puts personStatement
  `say "#{personStatement}"`
  user_input = gets
end

randobot.save
