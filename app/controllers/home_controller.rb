class HomeController < ApplicationController
  def index   
  end

  def search 
    ex_params = {s: params[:title],r: 'json',apikey: ENV['OMDB_ID'],plot: 'full'}
    response = Faraday.new.get('http://www.omdbapi.com/',ex_params)
    if response.status == 200
      data = JSON.parse(response.body)
      if data["Response"] == "True"
        @moovies = data["Search"]
      else
        
      end
    end      
  end

  def show
    ex_params = {i: params[:key],r: 'json',apikey: ENV['OMDB_ID'],plot: 'full'}
    response = Faraday.new.get('http://www.omdbapi.com/',ex_params)
    if response.status == 200
      data = JSON.parse(response.body)
      if data["Response"] == "True"
        @moovie = data
      else
        
      end
    end      
  end
end