
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
   #READ
  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    @articles = Article.all
    erb :"index"
  end

  #form
  get '/articles/new' do
    @article = Article.new
    erb :"new"
  end
  #why post :because its where the user input will go from the method/post action/articles of new.erb
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :"show"
  end

# UPDATE
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"edit"
  end

  # show
 patch '/articles/:id' do
   @article = Article.find(params[:id])
   @article.update(params[:article])
   redirect to "/articles/#{@article.id}"
   erb :"show"
 end


  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end
