
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index
  get '/' do

    redirect to "/articles"
  end

  # create
  get '/articles/new' do

    erb :new
  end

  # create
  post '/articles' do
    @article = Article.create(params)

    redirect to "/articles/#{Article.last.id}"
  end

  # read
  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  # read
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  # update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  # update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])

    redirect to "/articles/#{@article.id}"
  end

  # destroy
  delete '/articles/:id' do
    Article.destroy(params[:id])

    redirect to "/articles"
  end

end
