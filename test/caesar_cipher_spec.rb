require 'rspec'
require '../model/caesar_cipher'
require '../model/alphabet'

describe CaesarCipher do

  it "should replace a word with another at 'n' positions right on the alphabet" do
    expect(CaesarCipher.with_displacement(6).encode("ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")).to eq "GHIJKLMNÑOPQRSTUVWXYZABCDEF"
  end

  it "should replace a word with another at 'n' positions left on the alphabet" do
    expect(CaesarCipher.with_displacement(6).decode("GHIJKLMNÑOPQRSTUVWXYZABCDEF")).to eq "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
  end

  it "only modifies words but not numbers, special characters or whitespaces" do
    expect(CaesarCipher.with_displacement(10).encode("1")).to eq "1"
    expect(CaesarCipher.with_displacement(10).encode("!")).to eq "!"
    expect(CaesarCipher.with_displacement(10).encode(" ")).to eq " "
  end

  it "could be possible to encode complex messages" do
    expect(CaesarCipher.with_displacement(5).encode("GREAT! YOU ARE A GOOD PROGRAMMER!")).to eq "LWJFY! DTZ FWJ F LTTI UWTLWFQQJW!"
  end

  it "could be possible to decode complex messages" do
    expect(CaesarCipher.with_displacement(5).decode("LWJFY! DTZ FWJ F LTTI UWTLWFQQJW!")).to eq "GREAT! YOU ARE A GOOD PROGRAMMER!"
  end

end