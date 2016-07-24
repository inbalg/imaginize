require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))

Phrase.delete_all

# songs
Phrase.create!(text: "Who let the dogs out", category: "songs")
Phrase.create!(text: "Imagine there's no heaven.. It's easy if you try", category: "songs")
Phrase.create!(text: "Stairway to heaven", category: "songs")
Phrase.create!(text: "If you're going to san-francisco", category: "songs")
Phrase.create!(text: "under the bridge", category: "songs")
Phrase.create!(text: "There is a crack, a crack in everything.. That's how the light gets in", category: "songs")
Phrase.create!(text: "don't cry for me argentina", category: "songs")
Phrase.create!(text: "quit playing games with my heart", category: "songs")
Phrase.create!(text: "hit me baby one more time", category: "songs")
Phrase.create!(text: "life in plastic it's fantastic", category: "songs")
Phrase.create!(text: "back to black", category: "songs")
Phrase.create!(text: "The house of the rising sun", category: "songs")
Phrase.create!(text: "while my guitar gently weeps", category: "songs")
Phrase.create!(text: "rolling in the deep", category: "songs")
Phrase.create!(text: "my oh my do you want to say goodbye", category: "songs")

# movies
Phrase.create!(text: "reservoir dogs", category: "movies")
Phrase.create!(text: "minority report", category: "movies")
Phrase.create!(text: "home alone", category: "movies")
Phrase.create!(text: "fight club", category: "movies")
Phrase.create!(text: "pulp fiction", category: "movies")
Phrase.create!(text: "One flew over the cuckoo's nest", category: "movies")
Phrase.create!(text: "The silence of the lambs", category: "movies")
Phrase.create!(text: "American History 2", category: "movies")
Phrase.create!(text: "American Pie 3", category: "movies")
Phrase.create!(text: "The lion king", category: "movies")
Phrase.create!(text: "A clockwork orange", category: "movies")
Phrase.create!(text: "Star wars", category: "movies")
Phrase.create!(text: "Full metal jacket", category: "movies")
Phrase.create!(text: "Fear and loathing in Las-Vegas", category: "movies")

# proverbs
Phrase.create!(text: "Don't repeat yourself", category: "proverbs")
Phrase.create!(text: "When in Rome, do as the Romans", category: "proverbs")
Phrase.create!(text: "A picture is worth a thousand words", category: "proverbs")
Phrase.create!(text: "don't judge a book by its cover", category: "proverbs")
Phrase.create!(text: "are we there yet", category: "proverbs")

Phrase.all.each do |phrase|
  phrase.update(text: phrase.text.downcase)
end

puts "Done!"