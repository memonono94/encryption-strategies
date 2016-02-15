require 'rspec'
require '../model/alphabet'

describe Alphabet do

  it "should return the position of a word" do
    expect(Alphabet.new.position_in_alphabet("A")).to be 1
  end

  it "should return the word on a position" do
    expect(Alphabet.new.word_in_position(1)).to eq "A"
  end

  it "could be possible to know quantity of words in alphabet" do
    expect(Alphabet.new.total_number_of_words).to be 27
  end

  it "could be possible to know if a word is present on the alphabet" do
    expect(Alphabet.new.present?("a")).to be_truthy
    expect(Alphabet.new.present?("!")).to be_falsey
    expect(Alphabet.new.present?("0")).to be_falsey
  end

end