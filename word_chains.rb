require 'set'
require './string_expansion.rb'

class WordChains
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
  end

  def adjacent_words(word)
    @dictionary.select {|el| word.adjacent?(el)}
  end
end

if $PROGRAM_NAME == __FILE__
  wc = WordChains.new('dictionary.txt')
  wc.adjacent_words('bug')
end