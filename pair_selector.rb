class PairSelector
  def initialize(list_of_names)
    @list_of_names = list_of_names
    @bye = "You'll forever be alone"
  end

  def all_possible_pairs
    players = evenise_players
    all_rounds = []
    number_of_players = players.length
    num_of_rounds = number_of_players - 1

    (1..num_of_rounds).each {
      players = rotate_players(players)
      all_rounds.push find_round_matches(players)
    }

    all_rounds
  end

  private

  def evenise_players
    players = @list_of_names.clone
    if players.length % 2 != 0
      players.push(@bye)
    end
    players
  end

  def find_round_matches(players)
    player_sets = players.each_slice(players.length / 2).to_a
    player_sets[0].map.with_index { |element, index| [element, player_sets[1][index]] }
  end

  def rotate_players(players)
    players_in_two_lists = players.each_slice(players.length / 2).to_a

    first_player_list = players_in_two_lists[0]
    second_player_list = players_in_two_lists[1]
    static_player = first_player_list.shift
    second_player_list.push first_player_list.pop
    first_player_list.unshift second_player_list.shift

    first_player_list.unshift static_player

    first_player_list.concat second_player_list
  end

end
