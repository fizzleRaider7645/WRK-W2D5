require 'byebug'

def my_min(arr)
  min = 0

  arr.each do |el|
    min = el if el < min
  end

  min
end

list = [0, 3, 5, 4, -5, 10, 1, 90]

p my_min(list)

def largest_continuous_subsum(arr)
  sub_arrays = []
  largest_sum = nil
  idx = 0
  while idx < arr.length - 1

    jdx = idx

    while jdx < arr.length
      sub_arrays << arr[idx..jdx]
      jdx += 1
    end
    idx += 1
  end
  sub_arrays.each do |sub_arr|
    largest_sum = sub_arr.reduce(:+) if largest_sum.nil? || sub_arr.reduce(:+) > largest_sum
  end
  largest_sum
end


def largest_continuous_subsum(arr)
  largest_sum = nil
   local_sum = 0
   arr.each_with_index do |num, idx|
     local_sum += num
     largest_sum = local_sum if largest_sum.nil? || local_sum > largest_sum
     local_sum = 0 if local_sum < 0
   end

   largest_sum
end

def anagrams_gen(str)
  return [str] if str.length <= 1
  letters = str.chars
  first = letters.shift
  anagrams = anagrams_gen(letters.join)
  total_anagrams = []
  anagrams.each do |ang|
    (0..ang.length).each do |i|
      total_anagrams << (ang[0...i] + first + ang[i..-1])
    end
  end
  total_anagrams
end

def first_anagram?(str1, str2)
  anagrams = anagrams_gen(str1)
  anagrams.include?(str2)
end

def second_anagram?(str1, str2)
  i = 0
  # debugger

  while i < str1.length
    current_letter = str1[i]
    if str2.include?(current_letter)
      str2.delete! current_letter
      str1.delete! current_letter
      next
    end
    i += 1
  end

  str1.empty? && str2.empty?
end

def third_anagram?(str1, str2)
  str1 = merge_sort(str1.chars)
  str2 = merge_sort(str2.chars)
  str1 == str2
end

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2

  sorted_left = merge_sort(array.take(mid))
  sorted_right = merge_sort(array.drop(mid))

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first < right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end
  merged + left + right
end

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.each_char do |char|
    str1_hash[char] += 1
  end

  str2.each_char do |char|
    str2_hash[char] += 1
  end

  return false unless str1_hash.count == str2_hash.count

  str1_hash.each do |key, value|
    return false unless value == str2_hash[key]
  end

  true
end
