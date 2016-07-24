module GoogleSearchClient
  require 'httparty'
  # that's the one we use for review gui - not sure how to create a new one
  GOOGLE_SEARCH_CX = "012793117851164214045:7otlwk9rauc"
  # that's a new one I created
  GOOGLE_SEARCH_KEY = "AIzaSyDYHdv0Z5hZy4YzizVU1uT-3q6X6A4BW88"

  def self.search_image(name)
    options = {
        'q'            => name,
        'searchType'   => 'image',
        'imgType'      => 'clipart',
        'imgSize'      => 'medium',
        'imgColorType' => 'color',
        'cx'           => GOOGLE_SEARCH_CX,
        'key'          => GOOGLE_SEARCH_KEY
    }
    HTTParty.get("https://www.googleapis.com/customsearch/v1?", :query => options)
  end
end
