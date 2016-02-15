class Alphabet

  def initialize
    @words = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
  end

  def position_in_alphabet word
    @words.index(word.upcase) + 1
  end

  def word_in_position position
    @words[position - 1]
  end

  def total_number_of_words
    27
  end

  def present? word
    !@words.index(word.upcase).nil?
  end
end