class GamesController < ApplicationController
  def new
    # random string of 8 letters
    @letters = ('a'..'z').to_a.shuffle[0,8].join
  end

  def score
  end
end
