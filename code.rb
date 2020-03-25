class CowsAndBulls
  attr_accessor :guess, :i,:elements,:array_with_random_no

  def initialize
    @elements = get_elements
    @array_with_random_no = get_sample
    @guess = nil
    @i = 1
    print "\\|/          (__)
     `\\------(oo)
       ||    (__)
       ||w--||     \\|/
   \\|/ \n\n Zgadnij liczbę: "
  end

  def start_game
    loop do
      init_bulls_and_cows
      loop do
        puts "Proba  #{@i}: "
        @guess = gets.chomp.chars.map(&:to_i)
        exit if @guess.empty?
        break if guess_check
        increment_counter
        puts "Wpisz #{@elements} unikalne cyfry !"
      end
      if @guess == @array_with_random_no
        puts "Odgadłes za #{@i} razem"
        break
      end
      @elements.times do |j|
        if @guess[j] == @array_with_random_no[j]
          increment_bulls
        elsif @array_with_random_no.include? @guess[j]
          increment_cows
        end
      end
      increment_counter
      return_score(@bulls,@cows)
    end
  end

  private

  def get_sample
    (0..9).to_a.sample(@elements)
  end

  def get_elements
    4
  end

  def guess_check
    @guess.size == @elements && @guess.uniq.size == @elements
  end

  def init_bulls_and_cows
    @bulls = 0
    @cows = 0
  end
  
  def return_score(bulls,cows)
    puts "Bykow: #{bulls} \n Krow: #{cows} \n"
  end

  def increment_bulls
    @bulls += 1
  end

  def increment_cows
    @cows += 1
  end

  def increment_counter
    @i += 1
  end
end

game = CowsAndBulls.new
game.start_game
