def normalise_ascii(ascii_input)
  normalised_ascii_input = 0
  if ("A".ord.."Z".ord).include?(ascii_input)
    normalised_ascii_input = ascii_input - "A".ord
  elsif ("a".ord.."z".ord).include?(ascii_input)
    normalised_ascii_input = ascii_input - "a".ord
  end
  return normalised_ascii_input
end

def caesar_cipher(message, shift_by)
  ciphered_message = []
  message_split = message.split('')

    message_split.each do |substring|
      if substring.match?(/[A-Za-z]/)
        normalised_substring = (normalise_ascii(substring.ord) + shift_by) % 26
        if ("A".ord.."Z".ord).include?(substring.ord)
          ciphered_message.push((normalised_substring.chr + "A".ord).chr)
        elsif ("a".ord.."z".ord).include?(substring.ord)
          ciphered_message.push((normalised_substring + "a".ord).chr)
        end
      else
        ciphered_message.push(substring)
      end
    end
    return ciphered_message.join
end

puts caesar_cipher("testing the cipher!", 4)
