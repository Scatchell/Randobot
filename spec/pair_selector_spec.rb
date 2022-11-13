require_relative "../pair_selector.rb"

def print_all_possible_pairs(all_possible_pairs)
  all_possible_pairs.each do |pair_group|
    pair_group.each do |pair|
      puts pair.join(' <----> ')
    end
    puts '----------'
  end
end

describe PairSelector do
  context "Should create groupings of pairs" do

    it "should generate a list of all possible pairs from four items" do
      ps = PairSelector.new ['a', 'b', 'c', 'd']
      all_possible_pairs = ps.all_possible_pairs

      print_all_possible_pairs(all_possible_pairs)

      expect(all_possible_pairs).to eq [
                                         [["a", "c"], ["a", "d"]],
                                         [["b", "c"], ["b", "d"]],
                                         [["a", "b"], ["c", "d"]]
                                       ]
    end
  end
end
