class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(line_text, line_number)
    @content = line_text
    @line_number = line_number
    @highest_wf_count = 0
    @highest_wf_words = []

    calculate_word_frequency
  end

  def calculate_word_frequency
    words_with_count = {}

    @content.split(' ').each do |word|
      word = word.downcase
      words_with_count[word] = 0 if words_with_count[word].nil?
      words_with_count[word] += 1
      if words_with_count[word] > @highest_wf_count
        @highest_wf_count = words_with_count[word]
      end
    end

    words_with_count.each do |word, count|
      @highest_wf_words << word if count == @highest_wf_count
    end
  end
end

class Solution
  attr_reader :analyzers, :highest_count_across_lines,
              :highest_count_words_across_lines

  def initialize
    @analyzers = []
  end

  def analyze_file
    read_lines = File.readlines('max_word_frequency/test.txt')

    read_lines.each_with_index do |line, index|
      @analyzers << LineAnalyzer.new(line, index)
    end
  end

  def calculate_line_with_highest_frequency
    @highest_count_across_lines = 0
    @highest_count_words_across_lines = []

    @analyzers.each do |line_analyzer|
      if line_analyzer.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = line_analyzer.highest_wf_count
      end
    end

    @analyzers.each do |line_analyzer|
      if line_analyzer.highest_wf_count == @highest_count_across_lines
        @highest_count_words_across_lines << line_analyzer
      end
    end
  end

  def print_highest_word_frequency_across_lines
    puts 'The following words have the highest word frequency per line:'
    @highest_count_words_across_lines.each do |line_analyzer|
      puts "#{line_analyzer.highest_wf_words}" \
           "(appears in line #{line_analyzer.line_number})"
    end
  end
end
