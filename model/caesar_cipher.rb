require_relative 'string'

class CaesarCipher

  def self.with_displacement displacement
    self.new displacement
  end

  def initialize displacement
    @displacement = displacement
  end

  def encode text
    displace_words(text, lambda{|word_position, displacement| word_position + displacement })
  end

  def decode text
    displace_words(text, lambda{|word_position, displacement| word_position - displacement })
  end

  private

  def displace_words(text, displacement_method)
    text.collect do |word|
      WordDisplacer.displacer_for_word_with_displacement(word, @displacement)
                   .displace_with_displacement_method(displacement_method)
    end
  end

  class WordDisplacer

    def self.displacer_for_word_with_displacement word, displacement
      [

          OutAlphabetDisplacer.new(word, displacement),
          InAlphabetDisplacer.new(word, displacement)

      ].detect{|displacer| displacer.can_displace? }
    end

    def initialize word, displacement
      @alphabet = Alphabet.new
      @word = word
      @displacement = displacement
    end

    def displace
      raise RuntimeError.new("Subclass Responsability!")
    end

  end

  class OutAlphabetDisplacer < WordDisplacer

    def can_displace?
      !@alphabet.present?(@word)
    end

    def displace_with_displacement_method displacement_method
      @word
    end

  end

  class InAlphabetDisplacer < WordDisplacer

    def can_displace?
      @alphabet.present?(@word)
    end

    def displace_with_displacement_method displacement_method
      @alphabet.word_in_position(displacement_method.call(@alphabet.position_in_alphabet(@word), @displacement) % @alphabet.total_number_of_words)
    end

  end

end