class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @post_plants = PostPlant.all
  end
end
