class Admin::HomesController < ApplicationController
  def top
    @post_plants = PostPlant.all
  end
end
