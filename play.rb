## Class Hangman contains all the game and its functions.

class Hangman 

# Intial Hangman funcion with global variables

    def initialize 
        @word = words.sample
        @lives = 7
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
        end

    end

#Array of [words, clue].

    def words
        [
            ["Bitcoin", "Digital currency using block-chain."],
            ["Ruby", "Great programming language."],
            ["Software", "Modern world depends on software."],
            ["Dog", "Human's best friend."],
            ["Artificial", "Something that is not natural."],
        ]
    end

    
    #Start of the game, ask user for a letter.
    def begin 
        system('cls')
        puts "New game started... your word is #{@word.first.length} characters long"
        print_teaser 

        enter_letter
    end

    def print_teaser user_guess = nil
        update_teaser(user_guess) unless user_guess.nil?     
        puts @word_teaser
    end

    def update_teaser user_guess
    new_teaser = @word_teaser.split
    new_teaser.each_with_index do |letter, index|
        #Replace blank values with letters if it matches
        if letter == '_' && @word.first[index].downcase == user_guess
          new_teaser[index] = user_guess
        end
    end
    
    @word_teaser = new_teaser.join(' ')
    end

def new_attempt
    
end

    def enter_letter
    if @lives > 0
        puts "Clue: #{@word.last} "
        puts "Enter a letter or type 'exit' to end game"
        user_guess = gets.chomp.downcase
        #if the letter is in the word then is a goodguess (no case sentive)
        good_guess = @word.first.downcase.include? user_guess
        
        if user_guess == "exit"
            puts 'Thanks for playing!'
        elsif user_guess.length > 1
            system('cls')
            puts "Please insert only 1 letter"
            print_teaser user_guess
        puts "Lives: #{@lives}"
        enter_letter    
        elsif good_guess 
        puts "You are correct!"

        system('cls')
        print_teaser user_guess

        if @word.first.downcase == @word_teaser.split.join
        puts 'Congratulations, you have won this game!'
        else
        puts "Lives: #{@lives}"
        enter_letter
        end
    else
        system('cls')
        @lives -= 1
        print_teaser user_guess
        puts "Lives: #{@lives}"
        enter_letter      
        
    end  
    
    else
        puts "Game over!"
    end
    end

end

game = Hangman.new
game.begin