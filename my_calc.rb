system "clear"

puts "Welcome to your Command Line Calculator!"
print "Enter your equation: "
entry = gets.chomp

def doAnother
  print "Would you like to do another calculation? (y/n)"
  result = gets.chomp
  if result == "y"
    print "Enter your equation: "
    entry = gets.chomp
    calc(entry)
  else
    puts "Good-bye!"
    exit(0)
  end
end

def calc(string)

  arr2 = []
  arr = string.delete(" ").split("").each_with_index do |x, i|
    if ("0".."9").include?(x)
        arr2.push(x)
    else
        arr2.push(" ", x, " ")
    end
  end


  arr2= arr2.join("").split(" ")

  checkHash= {"ops" => 0, "nums" => 0}

  arr2.each do |value|
    if value == "+" || value == "-" || value == "/" || value == "*"
      checkHash["ops"] += 1
    else
      checkHash["nums"] += 1
    end
  end

  if checkHash["ops"] >= checkHash["nums"]
    p "Please double check your entry and try again."
    print "Enter your equation: "
    return calc(gets.chomp)
  else
    arr2.each_with_index do |j, k|
      if j == "*"
        arr2[k+1] = arr2[k-1].to_f * arr2[k+1].to_f
        arr2[k-1] = nil
        arr2[k] = nil
      end
    end

    arr2 = arr2.compact

    arr2.each_with_index do |val, index|
      if val == "/"
        arr2[index+1] = arr2[index-1].to_f / arr2[index+1].to_f
        arr2[index-1] = nil
        arr2[index] = nil
      end
    end

    arr2 = arr2.compact

    arr2.each_with_index do |z, q|
      if z == "+"
        arr2[q+1] = arr2[q-1].to_f + arr2[q+1].to_f
        arr2[q-1] = nil
        arr2[q] = nil
      end
    end

    arr2 = arr2.compact

    arr2.each_with_index do |h, s|
      if h == "-"
        arr2[s+1] = arr2[s-1].to_f - arr2[s+1].to_f
        arr2[s-1] = nil
        arr2[s] = nil
      end
    end

    arr2 = arr2.compact
    puts "The answer is #{arr2[0]}"
  end
  doAnother
end

calc(entry)
