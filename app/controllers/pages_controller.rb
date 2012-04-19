class PagesController < ApplicationController
  def home
    @jam = Jam.new
  end
  
  # GET /uur0cj2h
  def show
    @jam = Jam.find(params[:token])
  end
  
  
end
