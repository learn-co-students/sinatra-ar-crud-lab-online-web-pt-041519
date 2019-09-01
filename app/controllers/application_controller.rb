
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret"
  end

  get '/' do
    "Hello World"
  end

  get "/articles/new" do 
    erb :new 
  end   

  post "/articles" do 
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end   

  get "/articles/:id" do 
    @article = Article.find_by(id: params[:id])
    erb :show
  end 

  get "/articles" do 
    erb :index
  end   

  get "/articles/:id/edit" do 
    @article = Article.find_by(id: params[:id])
    erb :edit
  end  

  patch "/articles/:id" do 
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end  

  delete "/articles/:id/delete" do
    @article = Article.find_by(id: params[:id])
    @article.destroy
  end


end
