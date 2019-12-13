module HomeHelper
  def make_favourite(moovies,favourite,key)
    moovies.each do |moovie|
      if(moovies["omdbID"] == key)
        moovies["Favourite"] = favourite
      end    
    end
    binding.pry 
    return moovies
  end
end