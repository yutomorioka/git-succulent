class Public::HomesController < ApplicationController
  def top
    @post_plants = PostPlant.all.reverse_order
    @tags = Tag.all
  end

  def search
    if @search = params[:search]
      @records = Plant.search_for(@search)
    elsif @tags = params[:tag_ids]
      @records = Tag.search_for(@tags)
    end
  end
  
end
