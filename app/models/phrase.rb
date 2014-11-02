require 'httparty'

class Phrase < ActiveRecord::Base
  include HTTParty

  def as_image
    if id==1
      File.open("/Users/inbal/Pictures/interview1.jpeg", 'rb')
    else
      File.open("/Users/inbal/Pictures/interview2.jpeg", 'rb')
    end

  end

  def check_guess(guess)
    correct_phrase =  text.downcase.gsub(/\W/, '')
    formatted_guess = guess.downcase.gsub(/\W/, '')

    correct_phrase == formatted_guess
  end
end
