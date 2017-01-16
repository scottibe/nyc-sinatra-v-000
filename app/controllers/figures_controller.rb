require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all 
    erb :'/figures/new' 
  end  

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end  

  get '/figures/:id/edit' do 
    @figure = Figure.find([:id])
    erb :'/figures/edit'
  end   

  post '/figures' do 
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect("/figures/#{figure.id}")  
  end  
  

end  