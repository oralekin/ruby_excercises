#!/usr/bin/ruby

require_relative "diffs"

def printchars(char, iter)
  (1..iter).each {|_|
    print(char)
  }
end


def play
  cheats = false
  diff = diff_select diffs
  puts "You chose to play the " + diff.to_s + " difficulty!"
  rdm_number = rand(diffs[diff][1])+1
  puts "I have picked a random number between 1 and " + diffs[diff][1].to_s + "."
  if cheats
    puts "Your number is " + rdm_number.to_s + ". Please turn off cheats if you want to actually play!"
  end

  win = seq diffs[diff], rdm_number
  if win
    puts "Congratz on winning a badly made guessing game!"
  else
    puts "Oops, not too good at guessing are we? You might want to try an easier setting..."
  end


end


def seq (diff_array, rdm)
  guess_iter = 0
  prev_guess = rdm
  while true

    # ask for player to guess and store the guess in cur_guess
    print "[tries left: " + (diff_array[2] - guess_iter).to_s + "] "
    print "Go ahead, guess " + (if guess_iter == 0; "a"; else; "another"; end) + " number: "
    cur_guess = gets.chomp

    # ask again if input isnt a positive integer
    until /\A\d+\z/.match(cur_guess)
      print "[tries left: " + (diff_array[2] - guess_iter).to_s + "] "
      print "Please enter a valid positive integer:"
      cur_guess = gets.chomp
    end

    cur_guess = cur_guess.to_i
    
    # if you guessed correctly
    if cur_guess == rdm
      return true
    end

    # if guess is bigger than max random
    if cur_guess.to_i > diff_array[1]
      puts "wth that's bigger than the max number!"
      puts "ill let you off without removing a guess"
      # un-increment the guess number
      guess_iter = guess_iter - 1
    end

    puts say_hot_cold prev_guess, cur_guess, rdm

    # increment the guess number
    guess_iter = guess_iter+1

    # cur_guess is now prev_guess
    prev_guess = cur_guess

    # if no more guesses left
    if guess_iter == diff_array[2]
      return false
    end

    puts "-*-"*6

  end

end


def say_hot_cold(prev, cur, set)
  cur_diff = cur  - set
  pre_diff = prev - set
  # less cold
  #   you get the idea
  #   "Getting warmer but still pretty cool."
  # colder
  #    "It's starting to get really cold."
  #
  # cold
  #   say this when going from positive to negative diff
  #   "You just got hella colder."
  # hot
  #   say this when going from negative to positive diff
  #   "You feel a huge heat wave passing through you... You are now hot."
  #
  # hotter
  #   say this when still in positive diff but cur>prev
  #   "Is it just me or is this room getting hotter by the second."
  # less hot
  #   say this when still in positive but prev>cur
  #   "Getting cooler, that's a start. You just need to go a bit further..."
  #
  # return the string, player does the rest
  #
  if cur_diff<0
    # cold!
    if pre_diff >= 0
      "You just got hella cold!"
    else
      if (pre_diff - cur_diff) < 0
        "Getting warmer but still pretty cool."
      else
        "It's starting to get even colder."
      end
    end
  else
    # hot!
    if pre_diff <= 0
      "You feel a huge heat wave passing through you... You are now hot."
    else
      if (pre_diff - cur_diff) > 0
        "Getting cooler, that's a start. You just need to go a bit further..."
      else
        "Is it just me or is this room getting hotter by the second."
      end
    end

  end


end

def diff_select(diffs)
  puts "Choose how hard you want the game to be. Effects maximum number to guess and max number of tries."
  puts "Alternatively, you can enter two numbers seperated by a comma for custom settings. eg. 10,2"
  (1..diffs.length - 1).each {|i|
    puts (96 + i).chr + ") " + diffs[diffs[:difflist][i - 1]][0]
  }

  chosediff = gets

  diffs[:difflist][chosediff.ord - 97]

end

play