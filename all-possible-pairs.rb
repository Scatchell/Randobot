#!/usr/bin/env ruby

require_relative './pair_selector.rb'

$PAIRS = ['anthony', 'paula', 'paola', 'douglas', 'david', 'sharath', 'joel', 'sara', 'jose', 'poppy'];

pair_selector = PairSelector.new $PAIRS

pair_selector.all_possible_pairs.each do |pair_group|
  pair_group.each do |pair|
    puts pair.join(' <----> ')
  end
  puts '----------'
end
