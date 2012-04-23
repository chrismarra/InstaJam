class PagesController < ApplicationController

  def home
    @jam = Jam.new
  end  
  
end
