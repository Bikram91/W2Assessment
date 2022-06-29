# execute this file to play your game once all specs are completed
# no code needs to be written in this file

require_relative "tic_tac_toe"

def initialize(num)
    @player_1 = Player.new(:X)
end

TicTacToe.new.play