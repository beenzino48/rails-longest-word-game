words_array = ["c", "k", "u", "f" ]
word_string = "yno"
letters_array = ["c", " ", "k", " ", "m", " ", "u", " ", "y", " ", "n", " ", "o", " ", "a"]
letters_string = "c k m u y n o a"



# i want this method to return false

  p words_array.all?{ |letter| letters_array.include?(letter) }

  answer = (words_array - letters_array)

  p answer
