puts "Welcome to randobot 6000"
#@people = (1...7).to_a
people = [:Remo, :Neil, :Godwin]

user_input = ""

while (user_input != 'q')
    person = people.sample
    puts person
    people.delete(person)
    p people
    `say "It is #{person}'s turn."`
    user_input = gets
end
