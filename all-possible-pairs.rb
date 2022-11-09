#!/usr/bin/env ruby

$PAIRS = ['anthony', 'paula', 'paola', 'douglas', 'david', 'sharath', 'joel', 'sara', 'jose', 'poppy'];

def all_possible_pairs(list_of_names)
  num_of_groups = list_of_names.length / 2

  names_in_two_lists = list_of_names.each_slice(num_of_groups).to_a

  all_combos_between_two_lists = names_in_two_lists[0].product(names_in_two_lists[1]).to_a.each_slice(num_of_groups).to_a
  all_combos_in_first_list = names_in_two_lists[0].combination(2).to_a.each_slice(num_of_groups).to_a
  all_combos_in_second_list = names_in_two_lists[1].combination(2).to_a.each_slice(num_of_groups).to_a

  puts all_combos_between_two_lists
  puts '---------'
  puts all_combos_in_first_list
  puts '---------'
  puts all_combos_in_second_list
  puts '---------'

  return all_combos_between_two_lists.concat(all_combos_in_first_list).concat(all_combos_in_second_list).to_a
end

all_possible_pairs($PAIRS).each do |pair_group|
  pair_group.each do |pair|
    puts pair.join(' <----> ')
  end
  puts '----------'
end
