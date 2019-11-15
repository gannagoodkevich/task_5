# frozen_string_literal: true

class HistogramGenerator
  def self.process_string(string:)
    if !string.empty?
      string = string.gsub(/[ ,.\r\n]/, '').split('')
      string.each_with_object(Hash.new(0)) do |word, result|
        result[word] += 1
      end
    else
      {}
    end
  end

  def self.sort_histogram(histogram)
    sorting = ->(_word, occurrences) do occurrences; end
    histogram.sort_by do |word, occurrences|
      sorting.call(word, occurrences)
    end
    histogram.to_h
  end
end

module App
  HARRY_POTTER_PART = 'When Mr. and Mrs. Dursley woke up on the dull, gray
Tuesday our story starts, there was nothing about the cloudy sky outside to
suggest that strange and mysterious things would soon be happening all
over the country. Mr. Dursley hummed as he picked out his most boring tie for
work, and Mrs. Dursley gossiped away happily as she wrestled a screaming
Dudley into his high chair.'
  def perform
    text = ''
    puts('reading file')
    puts("extracted string: #{text}")
    histogram = HistogramGenerator.process_string(string: Text)
    puts('generated histogram:')
    puts(histogram)
    puts('sorted histogram:')
    puts(HistogramGenerator.sort_histogram(histogram))
  end

  def number_to_word(number)
    if number > 9
      'oops'
    else
      send("print_#{number}")
    end
  end

  def print_1
    'one'
  end

  def print_2
    'two'
  end

  def print_3
    'three'
  end

  def print_4
    'four'
  end

  def print_5
    'five'
  end

  def print_6
    'six'
  end

  def print_7
    'seven'
  end

  def print_8
    'eight'
  end

  def print_9
    'nine'
  end
end

puts App.perform
[1, 2, 3, 4, 5, 6, 7, 8, 9, 13_666].each do |number|
  puts App.number_to_word(number)
end
