require "open-uri"

class GamesController < ApplicationController
  def new
    # random string of 8 letters
    letters = ('a'..'z').to_a.shuffle[0,8].join
    @letters = letters.split('')
  end

  def score
    # 1. getting the word from the user input ✅
    word_string = params[:word]
    word_array = params[:word].split('')

    # get the list of 8 letters  ✅
    grid = ('a'..'z').to_a.shuffle[0,8].join
    letters_array = grid.split('')

    # parsing the dictionary to receive true  the word is in the dictionary
    # url = "https://wagon-dictionary.herokuapp.com/#{word}"
    # @words = JSON.parse(URI.open(url).read[:found])

    # 1. if word is not made from the grid  ✅
    if (word_array - letters_array).empty? == true
      @answer = "your test cannot be built out of #{word_array}"
    elsif

    # test against the api dictionary to see if it returns true
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
      dictionary_test = JSON.parse(URI.open(url).read[found])

      # 2. The word is valid according to the grid, but is not a valid English word ✅
      (word_array - letters_array).empty? == false && dictionary_test == false
      @answer = "The word #{word_array} is not a valid english word"

    # 3. The word is valid according to the grid and is an English word
    else
      @answer = "The word #{word_array} is a valid word"
    end
  end
end
