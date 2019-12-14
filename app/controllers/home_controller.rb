class HomeController < ApplicationController
  require 'home_helper'
  $moovies = []
  def index   
  end

  def search 
    ex_params = {s: params[:title],r: 'json',apikey: ENV['OMDB_ID'],plot: 'full'}
    response = Faraday.new.get('http://www.omdbapi.com/',ex_params)
    if response.status == 200
      data = JSON.parse(response.body)
      if data["Response"] == "True"
        $moovies = data['Search']
        favourite_zero
        @moovies = $moovies
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

  def favourite
    key = params[:key]
    favourite = params[:favourite]
    $moovies.each do |moovie|
      if(moovie["imdbID"].eql?(key))
        moovie["Favourite"] = favourite.to_i
      end    
    end
    return $moovies
  end

  def show_all
    @flag = "show_all"
    @moovies = $moovies
  end

  def show_favourite
    @moovies = []
    $moovies.each do |moovie|
      if(moovie["Favourite"] == 1)
        @moovies.push(moovie)
      end
    end
  end

  def favourite_zero
    $moovies.each do |moovie|
      moovie["Favourite"] = 0
    end
  end  
end