class Public::HomesController < ApplicationController
  def top
  end

  def search
    if @search = params[:search]
      @records = Plant.search_for(@search).page(params[:page]).reverse_order
    elsif @tags = params[:tag_ids]
      @records = Tag.search_for(@tags).page(params[:page]).reverse_order
    end
  end

end
