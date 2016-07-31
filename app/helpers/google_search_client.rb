module GoogleSearchClient
  require 'httparty'
  ALL_WEB_CX = "007226449032027480272:y4z475iunfe"
  CLIPART_SITES_CX = "007226449032027480272:vn_vk55gcde"

  # GOOGLE_SEARCH_KEY = "AIzaSyDYHdv0Z5hZy4YzizVU1uT-3q6X6A4BW88" # Lior's key
  # GOOGLE_SEARCH_KEY = "AIzaSyDQn_uG061TWBvmb6TbgyQVps-OsN_aLYE" # test-key
   GOOGLE_SEARCH_KEY = "AIzaSyDgaxRFofq60v4Fadu81_FyNL0xzC4QXaA" # staging-key
  #GOOGLE_SEARCH_KEY = "AIzaSyDR90GaqzU1MwfWFBF7MAcXdoybKX3HWJg" # dev-key

  def self.search_image(name)
    options = {
        'q'            => name,
        'searchType'   => 'image',
        'imgType'      => 'clipart',
        # 'imgSize'      => 'medium',
        'imgColorType' => 'color',
        'cx'           => ALL_WEB_CX,
        'key'          => GOOGLE_SEARCH_KEY
    }
    HTTParty.get("https://www.googleapis.com/customsearch/v1?", :query => options)
  end
end

# https://openclipart.org/
# http://www.clker.com/
# http://classroomclipart.com/
# http://www.1001freedownloads.com/free-cliparts/
