ENV['RACK-ENV'] ||= 'development'

require 'sinatra/base'
# require './models/tag'
require './app/data_mapper_setup.rb'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  set :session, true

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/saving' do
    link = Link.create(url:params[:url], title:params[:title])
    tag = Tag.create(name:params[:tag])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  run! if app_file == $0

end
