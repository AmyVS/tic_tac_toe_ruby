require "./lib/game.rb"
require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/space.rb"

@current_game = nil
@board_hash = {1=>[0,0],2=>[0,1],3=>[0,2],4=>[1,0],5=>[1,1],6=>[1,2],7=>[2,0],8=>[2,1],9=>[2,2]}
@player_array = []

def tic_tac_toe

  puts "\nWelcome to the Tic-Tac-Toe game\n"

  @current_game = Game.new

  puts "Player 1, please enter your name"
  player1_name = gets.chomp
  puts "Player 2, please enter your name"
  player2_name = gets.chomp

  player_1 = Player.new({:name => player1_name})
  player_2 = Player.new({:name => player2_name})

  choice = rand(0).round

  if choice == 0
    puts "\n" + player_1.name + " is X and plays first\n\n"
    player_1.add_symbol({:symbol => 'X'})
    @player_array << player_1
    player_2.add_symbol({:symbol => 'O'})
    @player_array << player_2
  else
    puts "\n" + player_2.name + " is X and plays first\n\n"
    player_2.add_symbol({:symbol => 'X'})
    @player_array << player_2
    player_1.add_symbol({:symbol => 'O'})
    @player_array << player_1
  end

  draw_board

  while !@current_game.game_over?[0]
    puts "\nThe current player is " + @player_array[0].name + "\n"
    play(@player_array[0])
    draw_board
    if !@current_game.game_over?[0]
      puts "\nThe current player is " + @player_array[1].name + "\n"
      play(@player_array[1])
      draw_board
    end
  end

  puts "\n\nGame over!"
  if @current_game.game_over?[1] == "Draw"
    puts "The game is a draw\n\n"
  else
    puts @current_game.game_over?[3] + " " + @current_game.game_over?[1] + "s at " +
         @current_game.game_over?[2] + "\n\n"
  end

end

def draw_board
  for x_coord in 0..2 do
    board_row = ""
    for y_coord in 0..2 do
      if @current_game.board.all_spaces[x_coord][y_coord].is_marked_by == nil
        string_to_write = (@board_hash.key([x_coord,y_coord])).to_s
      else
        string_to_write = @current_game.board.all_spaces[x_coord][y_coord].is_marked_by.symbol
      end
      board_row << ("[" + string_to_write + "]")
    end
    puts board_row + "\n"
  end
end

def play(player)

  number_choice = 0

  while number_choice == 0
    puts "Choose the space number you'd like to mark."
    number_choice = gets.chomp.to_i

    if number_choice < 1 || number_choice > 9
      puts "Incorrect space number entered, please try again"
      number_choice = 0
    else
      coord_array = @board_hash.fetch(number_choice)
      if @current_game.board.all_spaces[coord_array[0]][coord_array[1]].is_marked?
        puts "That space is already marked. Please try again."
        number_choice = 0
      else
        @current_game.board.all_spaces[coord_array[0]][coord_array[1]].marked_by(player)
      end
    end
  end
end

tic_tac_toe

