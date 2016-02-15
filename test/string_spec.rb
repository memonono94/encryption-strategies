require 'rspec'
require '../model/string'

describe String do

  it "should be able to do something with each char" do
    expect("So cool!".collect{|word| word }).to eq "So cool!"
  end

end