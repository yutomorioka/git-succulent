class Public::HomesController < ApplicationController
  def top
  end

  def search
    @search = params[:search]
    @records = Plant.search_for(@search)
  end

end
