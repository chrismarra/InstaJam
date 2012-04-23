class JamsController < ApplicationController

  # GET /jams/1
  def show
    @jam = Jam.find_by_token(params[:token])
  
    #render_404 if @jam.nil?    
  end
  
  # POST /jams
  def create
    @jam = Jam.new(params[:jam])

      if @jam.save
        redirect_to '/jam/' + @jam.token
      else
        redirect_to '/',:notice => 'Whoops.'
      end
  end  
  
  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => :not_found
  end
  

end
