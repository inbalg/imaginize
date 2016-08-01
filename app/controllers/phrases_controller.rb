class PhrasesController < ApplicationController
  include GoogleSearchClient
  include PhrasesHelper
  include LightsHelper

  before_action :set_phrase, only: [:show, :edit, :update, :destroy]

  # GET /phrases
  # GET /phrases.json
  def index
    @success = SUCCESS
    @fail = FAIL
    @phrase = Phrase.find(rand(1..Phrase.count))
    @images = @phrase.text.split.map { |word| search_image_for(word) }
    render :show
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    @phrase = Phrase.find(params[:id])
  end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @phrase = Phrase.new(phrase_params)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to @phrase, notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrases/1
  # PATCH/PUT /phrases/1.json
  def update
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_guess
    @phrase = Phrase.find(params[:id])
    result  = @phrase.check_guess(params[:guess])

    if RASPBERRY_DEVICE
      threads = [Thread.new { turn_on_the_lights(result) }, Thread.new { play_sound(result) }]
      threads.each &:join
    end

    respond_to do |format|
      format.json { render json: {result: result, status: 200 } }
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to phrases_url, notice: 'Phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phrase_params
      params.require(:phrase).permit(:text)
    end


  def search_image_for(name)
    #return "http://mindtechnology.com/assets/images/Now-Green-Circle.jpg"
    name.downcase!
    if PRE_DEFINED.include?(name)
      return PRE_DEFINED[name][rand(PRE_DEFINED[name].size)]
    end

    results = GoogleSearchClient.search_image(name)

    if results['error'] || results['searchInformation']['totalResults'].to_i == 0
      puts "#{results['error'].andand['message'] || 'no results found'} for phrase <#{@phrase.text}>"
      nil
    else
      choose_image(results['items'])
    end
  end

  def choose_image(images)
    sample_size = [images.size, 10].min
    images[rand(sample_size)]['link']
  end

  def turn_on_the_lights(result)
    result ? success_lights : fail_lights
  end

  def play_sound(result)
    sound = result ? SUCCESS_SOUNDS[rand(SUCCESS_SOUNDS.size)] : FAIL_SOUNDS[rand(FAIL_SOUNDS.size)]
    sound_file = Rails.root.join("app", "assets", "images", sound)
    system "aplay #{sound_file}"
  end
end
