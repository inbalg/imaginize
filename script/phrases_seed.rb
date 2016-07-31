require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))

Phrase.delete_all

# songs
Phrase.create!(text: "don't cry for me argentina", category: "songs")
Phrase.create!(text: "Strawberry Fields Forever", category: "songs")
Phrase.create!(text:  "rolling in the deep", category: "songs")
Phrase.create!(text:  "hit me baby one more time", category: "songs")
Phrase.create!(text:  "don't stop me now", category: "songs")
Phrase.create!(text:  "yellow submarine", category: "songs")
Phrase.create!(text:  "genie in a bottle", category: "songs")
Phrase.create!(text:  "shake it off", category: "songs")
Phrase.create!(text:  "house of the rising sun", category: "songs")
Phrase.create!(text:  "under the bridge", category: "songs")
Phrase.create!(text:  "California king bed", category: "songs")
Phrase.create!(text: "candle in the wind", category: "songs")
Phrase.create!(text: "another one bites the dust", category: "songs")
Phrase.create!(text: "summer of 69", category: "songs")
Phrase.create!(text: "it's raining men", category: "songs")
Phrase.create!(text: "I'm singing in the rain", category: "songs")
Phrase.create!(text: "What A Wonderful World", category: "songs")
Phrase.create!(text: "American Pie", category: "songs")
Phrase.create!(text: "Hotel California", category: "songs")
Phrase.create!(text: "who let the dogs out", category: "songs")
Phrase.create!(text: "Cry Me a River",  category: "songs")
Phrase.create!(text: "Stairway To Heaven",  category: "songs")
Phrase.create!(text: "quit playing games with my heart", category: "songs")
Phrase.create!(text: "rolling in the deep", category: "songs")

# movies
Phrase.create!(text: "home alone", category: "movies")
Phrase.create!(text: "fight club", category: "movies")
Phrase.create!(text: "pulp fiction", category: "movies")
Phrase.create!(text: "One flew over the cuckoo's nest", category: "movies")
Phrase.create!(text: "The silence of the lambs", category: "movies")
Phrase.create!(text: "American History 2", category: "movies")
Phrase.create!(text: "American Pie 3", category: "movies")
Phrase.create!(text: "The lion king", category: "movies")
Phrase.create!(text: "Star wars", category: "movies")
Phrase.create!(text: "Full metal jacket", category: "movies")
Phrase.create!(text: "Fear and loathing in Las-Vegas", category: "movies")
Phrase.create!(text: "Back to the future", category: "movies")
Phrase.create!(text: "Star Trek", category: "movies")
Phrase.create!(text: "The dark knight", category: "movies")
Phrase.create!(text: "The Good, the Bad and the Ugly", category: "movies")
Phrase.create!(text: "Lord of the Rings", category: "movies")
Phrase.create!(text: "The Sound Of Music", category: "movies")
Phrase.create!(text: "X Man", category: "movies")
Phrase.create!(text: "Snow White And The Seven Dwarfs", category: "movies")
Phrase.create!(text: "Pirates of the Caribbean", category: "movies")
Phrase.create!(text: "The hunger games", category: "movies")

Phrase.all.each do |phrase|
  phrase.update(text: phrase.text.downcase)
end

puts "Done!"
