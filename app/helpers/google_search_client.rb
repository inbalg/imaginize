module GoogleSearchClient
  require 'httparty'
  ALL_WEB_CX = "007226449032027480272:y4z475iunfe"
  CLIPART_SITES_CX = "007226449032027480272:vn_vk55gcde"
  # that's a new one I created
  GOOGLE_SEARCH_KEY = "AIzaSyDR90GaqzU1MwfWFBF7MAcXdoybKX3HWJg"

  def self.search_image(name)
    options = {
        'q'            => name,
        'searchType'   => 'image',
        'imgType'      => 'clipart',
        # 'imgSize'      => 'medium',
        'imgColorType' => 'color',
        'cx'           => CLIPART_SITES_CX,
        'key'          => GOOGLE_SEARCH_KEY
    }
    HTTParty.get("https://www.googleapis.com/customsearch/v1?", :query => options)
  end
end

# https://openclipart.org/
# http://www.clker.com/
# http://classroomclipart.com/
# http://www.1001freedownloads.com/free-cliparts/
