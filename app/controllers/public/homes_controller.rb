class Public::HomesController < ApplicationController
  def top
  end

  def search
    @content = params[:content]
    @records = Plant.search_for(@content)
  end

end
