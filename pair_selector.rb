class PairSelector
  def initialize(list_of_names)
    @list_of_names = list_of_names
  end
  def all_possible_pairs
    num_of_groups = @list_of_names.length / 2

    names_in_two_lists = @list_of_names.each_slice(num_of_groups).to_a

    all_combos_between_two_lists = names_in_two_lists[0].product(names_in_two_lists[1]).to_a
    all_combos_in_first_list = names_in_two_lists[0].combination(2).to_a
    all_combos_in_second_list = names_in_two_lists[1].combination(2).to_a

    all_combos = all_combos_between_two_lists.concat(all_combos_in_first_list).concat(all_combos_in_second_list).to_a

    all_combos.each_slice(num_of_groups).to_a
  end
end
