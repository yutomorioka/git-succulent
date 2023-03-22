class Public::HomesController < ApplicationController
  def top
  end

  


  def search
    if (params[:search])[0] == '#'
      @records = Tag.search_for(params[:search])
    else
      @records = Plant.search_for(params[:search])
    end
  end

end
