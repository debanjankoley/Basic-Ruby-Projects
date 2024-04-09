$result = Hash.new(0)
def substrings_one_word(word, dictionary)
  arr = word.downcase.split("")
  dictionary.each do |substring|
    sub_arr = substring.split("")
    matched_letters = []
    sub_arr.each do |letter|
      if arr.include?(letter)
        matched_letters.push(letter)
      end
    end
    if matched_letters == sub_arr
      $result[matched_letters.join] += 1
    end
  end
  $result
end

def substrings(multiple_words, dictionary)
  words = multiple_words.split(" ")
  words.each { |word| substrings_one_word(word, dictionary) }
  $result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("Howdy partner, sit down! How's it going?", dictionary)