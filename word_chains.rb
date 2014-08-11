require 'set'
require './string_expansion.rb'

class WordChains
  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.readlines(dictionary_file_name).map(&:chomp))
  end

  def run(source, target)
    @target = target
    @current_words = [source]
    @all_seen_words = {source => nil}

    explore_current_words
    build_path(target)
  end

  def build_path(target)
    return nil unless @all_seen_words.keys.include?(target)

    "#{build_path(@all_seen_words[target])}\n#{target}"
  end

  def explore_current_words
    print "Thinking"
    until @current_words.empty?
      print "."
      active_word = @current_words.shift
      new_current_words = []

      adjacent_words(active_word).each do |word|
        unless @all_seen_words.keys.include?(word)
          @current_words << word
          @all_seen_words[word] = active_word
        end
        return nil if @all_seen_words.keys.include?(@target)
      end
    end
    print "\n\n"
  end

  def adjacent_words(word)
    @dictionary.select {|el| word.adjacent?(el)}
  end
end

if $PROGRAM_NAME == __FILE__
  wc = WordChains.new('dictionary.txt')
  puts "Input starting word."
  starting_word = gets.chomp
  puts "Input ending word."
  ending_word = gets.chomp
  chain = wc.run(starting_word, ending_word)
  if chain == nil
    puts "There is no chain."
  else
    puts "#{chain}"
  end
end