class WordChains
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name)
  end
end

if $PROGRAM_NAME == __FILE__
  wc = WordChains.new(dictionary.txt)
end