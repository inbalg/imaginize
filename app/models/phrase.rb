require 'httparty'

class Phrase < ActiveRecord::Base
  include HTTParty

  def as_image
      "http://images.clipartpanda.com/love-clip-art-red-love.svg"
  end

  def check_guess(guess)
    correct_phrase =  text.downcase.gsub(/\W/, '')
    formatted_guess = guess.downcase.gsub(/\W/, '')

    distance = Levenshtein.distance(correct_phrase, formatted_guess)
    distance <= 3
    # correct_phrase == formatted_guess
  end
end
