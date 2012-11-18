def diff(first, second)
  first_words = first.split(' ')
  second_words = second.split(' ')

  result = []
  #Returns back the index values of each array that has the commonality
  first_word_index, second_word_index = longest_common_array(first_words, second_words)
  p first_word_index
  p second_word_index
  if first_word_index[0] > 0
    subtractions = ['-']
    for i in 0..first_word_index[0]
      subtractions << first_words[i]
    end
    result << subtractions
  end
  if second_word_index[0] > 0
    additions = ['+']
    for i in 0..second_word_index[0]
      additions << second_words[i]
    end
    result << additions
  end
  equal = ['='] << first_words.values_at(first_word_index[0]..first_word_index[1])
  result << equal
  if first_word_index[0] > 0
    subtractions = ['-']
    for i in first_word_index[1]..first_words.length-1
      subtractions << first_words[i]
    end
    #result << subtractions
  end
  if second_word_index[0] > 0
    additions = ['+']
    for i in second_word_index[1]..second_words.length-1
      additions << second_words[i]
    end
    #result << additions
  end
  result
end

def longest_common_array(a1, a2)
  m = Array.new(a2.length){ [0] * a1.length }
  longest, x_longest, y_longest = 0,0,0
  (0 .. a1.length-1).each do |x|
    (0 .. a2.length-1).each do |y|
      if a1[x] == a2[y]
        m[y][x] = 1
        m[y][x] += m[y-1][x-1] if x > 0 && y > 0
        if m[y][x] > longest
          longest = m[y][x]
          x_longest = x
          y_longest = y
        end
      end
    end
  end
  [[x_longest-longest + 1, x_longest], [y_longest-longest + 1, y_longest]]
  #[a1[x_longest - longest + 1 .. x_longest], a2[y_longest - longest + 1 .. y_longest]]
end

p diff('this is a test', 'what in the world')
p diff('what is a test', 'this is a test')
p diff('testing', 'test')
p diff('test', "test")
