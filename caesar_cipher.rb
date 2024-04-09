def caesar_cipher(string, shift_factor)

  # first we convert the str to numbers in an array
  num_arr = string.split('').map { |letter| letter.ord }

  # then we shift the numbers by the shift factor keeping same case and wraping the alphabets
  shift_num_arr = num_arr.map do |num|

    # this block leaves symbols and spaces unchanged
    if !(num.between?(65, 90) || num.between?(97, 122))
      num

    # this block is to wrap letters from A-Z
    elsif num.between?(65,90)
      if (num + shift_factor) > 90
        num + shift_factor - 26
      elsif (num + shift_factor) < 65
        num + shift_factor + 26
      else
        num + shift_factor
      end

    # this block is wrap letters from a-z
    elsif num.between?(97, 122)
      if (num + shift_factor) > 122
        num + shift_factor - 26
      elsif (num + shift_factor) < 97
        num + shift_factor + 26
      else 
        num + shift_factor
      end
    end
  end

  #then we change the numbers back to letters and join them together
  p encrpted_str = shift_num_arr.map { |num| num.chr }.join
end

caesar_cipher("What a string!", 5)