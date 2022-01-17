ROMAN_NUMS = {
  "M" => 1000,
  "CM" => 900, "D" => 500, "CD" => 400, "C" => 100,
  "XC" => 90,  "L" => 50,  "XL" => 40,  "X" => 10,
  "IX" => 9,   "V" => 5,   "IV" => 4,   "I" => 1
}

def my_roman_numerals_converter(number)
    answer = ""
    ROMAN_NUMS.map do |letter, value| 
        amount, number = number.divmod(value)
        answer << letter * amount
    end
    return answer
end

#puts(roman(10))