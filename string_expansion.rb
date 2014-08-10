class String
  def adjacent?(word)
    return false unless word.length == self.length
    different_letters = 0
    self.each_char.with_index do |char, i|
      different_letters += 1 unless word[i] == char
    end
    return true if different_letters == 1
    false
  end
end