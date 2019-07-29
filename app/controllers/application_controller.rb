require_relative '../../config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # index is /articles
  get '/' do
    redirect to '/articles'
  end

  ### Create
  # New form
  get '/articles/new' do
    erb :new
  end

  # Create instance
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  
  ### Read
  # All
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # Instance
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


  ### Update
  # Edit form
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # Update instance
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    # @article.update(title: params[:title], content: params[:content])
    @article.update(params[:article])
    @article.save

    # Send new indicator to show
    @new = "yes"

    erb :edit
  end


  ### Delete
  delete '/articles/:id/delete' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end

end
