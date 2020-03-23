elements = 4
array_with_random_no = (0..9).to_a.sample(elements)
guess = nil
i=1
print "\\|/          (__)
     `\\------(oo)
       ||    (__)
       ||w--||     \\|/
   \\|/ \n\n Zgadnij liczbę: "
loop do
  bulls = 0
  cows = 0
  loop do
    puts "Proba  #{i}: "
    guess = gets.chomp.chars.map(&:to_i)
    exit if guess.empty?
    # Nie ma 4, nie ma unikalnych 4
    break if guess.size == elements && guess.uniq.size == elements
    puts "Wpisz #{elements} unikalne cyfry !"
  end
  if guess == array_with_random_no
    puts "Odgadłes za #{i} razem"
    break
  end
  elements.times do |j|
    if guess[j] == array_with_random_no[j]
      bulls += 1
      #   na tym samym miejscu w tablicy
    elsif array_with_random_no.include? guess[j]
      cows += 1
    # zawiera w ciagu
    end
  end
  i+=1
  puts "Bykow: #{bulls} \n Krow: #{cows} \n"
end
