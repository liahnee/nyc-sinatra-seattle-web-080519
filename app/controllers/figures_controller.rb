class FiguresController < ApplicationController
  # # add controller methods

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure_name = params[:figure][:name]
    @new_figure = Figure.create(name:@figure_name)
    figure_id = @new_figure.id


    title_id = params[:figure][:title_ids]
    @new1 = FigureTitle.create(title_id:title_id, figure_id:figure_id)

    @title_name = params[:title][:name]
    @new_title = Title.create(name:@title_name)
    FigureTitle.create(title_id:@new_title.id, figure_id:figure_id)
  
  
    landmark_name = params["landmark"]["name"]
    @new2 = Landmark.create(name:landmark_name, figure_id: figure_id)

    @landmark_name = params[:landmark][:name]
    @new4 = Landmark.create(name:@landmark_name, figure_id: figure_id)
    
    erb :'figures/show'
  end

    get '/figures/show' do 
      # @new_figure
      # @new1
      # @new_title
      # @new2
      # @new4
      erb :figures/show
    end
end
