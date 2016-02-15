class String

  def collect &a_block
    self.split(//).collect{|char| a_block.call(char) }.join
  end

end