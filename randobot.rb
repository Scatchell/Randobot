#!/Users/ThoughtWorks/.rvm/rubies/ruby-2.0.0-p451/bin/ruby
puts "Welcome to randobot 7000"

class Randobot
    def initialize
        @default_list = [:Leeza, :Musa, :Kuana, :Jonah, :Raymond, :Tsepo, :Deon, :Tsatsi]
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
end

def pressed_quit user_input
    user_input.include? 'q'
end

randobot = Randobot.new

user_input = ''

while (!pressed_quit user_input)
    person = randobot.next_person
    puts person
    `say "It is #{person}'s turn."`
    user_input = gets
end
