class HomeController < ApplicationController
  def index   
  end

  def search 
    ex_params = {t: params[:title],r: 'json',apikey: ENV['OMDB_ID'],plot: 'full'}
    response = Faraday.new.get('http://www.omdbapi.com/',ex_params)
    if response.status == 200
      @moovies = JSON.parse(response.body)
    end      
  end
end