require "open-uri"
require 'json'

class GamesController < ApplicationController
  def new
    # random string of 8 letters
    letters = ('a'..'z').to_a.shuffle[0,8].join
    @letters = letters.split('')
  end

  def included?(word, letters)
    word.all? { |letter| letters.include?(letter) }
  end

  def score
    # change the string of letters into an array
    letters_array = params[:letters].split('')
    letters_string = letters_array.join

    # 1. getting the word from the user input ✅
    word_string = params[:word].downcase
    word_array = params[:word].split('')

    # 1. if word is not made from the letters in the grid return failure  ✅
    if included?(word_array, letters_array) == false
      @answer = "your test cannot be built out of #{word_array.join}"

    else

      # test against the api dictionary to see if it returns true
      url = "https://wagon-dictionary.herokuapp.com/#{word_string}"
      dictionary_test = JSON.parse(URI.open(url).read)
      value = dictionary_test['found']

      if value
        # 3. The word is valid according to the grid and is an English word
        @answer = "The word #{word_array.join} is a valid word"
      else
        @answer = "The word #{word_array.join} is not a valid english word"
      end
    end
  end
end
