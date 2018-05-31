def bad_two_sum(arr, target_sum)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end

#O(n^2)

def okay_two_sum(arr, target_sum)
  arr.sort!

  i = 0
  j = arr.length - 1
  while i < arr.length
    if arr[i] + arr[j] == target_sum
      return true
    elsif i == j - 1
      return false
    elsif arr[i] + arr[j] > target_sum
      j -= 1
    elsif arr[i] + arr[j] < target_sum
      i += 1
    end
  end
end

def two_sum(arr, target_sum)
  hash_map = Hash.new(false)
  arr.each do |el|
    return true if hash_map[target_sum - el]
    hash_map[el] = true
  end
  false
end
