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
      ps = PairSelector.new [1, 2, 3, 4]
      all_possible_pairs = ps.all_possible_pairs
      expect(all_possible_pairs).to eq [
                                         [[1, 4], [3, 2]],
                                         [[1, 2], [4, 3]],
                                         [[1, 3], [2, 4]],
                                       ]
    end

    it "should generate a list of all possible pairs from six items" do
      ps = PairSelector.new [1, 2, 3, 4, 5, 6]
      all_possible_pairs = ps.all_possible_pairs

      expect(all_possible_pairs).to eq [[[1, 5], [4, 6], [2, 3]],
                                        [[1, 6], [5, 3], [4, 2]],
                                        [[1, 3], [6, 2], [5, 4]],
                                        [[1, 2], [3, 4], [6, 5]],
                                        [[1, 4], [2, 5], [3, 6]],
                                       ]
    end

    it "should add a break when the number of players is uneven" do
      ps = PairSelector.new [1, 2, 3]
      all_possible_pairs = ps.all_possible_pairs

      expect(all_possible_pairs).to eq [
                                         [[1, "You'll forever be alone"], [3, 2]],
                                         [[1, 2], ["You'll forever be alone", 3]],
                                         [[1, 3], [2, "You'll forever be alone"]],
                                       ]
    end

  end
end
