
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require "sinatra/reloader"
require_relative "db/connection.rb"
require_relative "models/pokemon"

require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'

get '/' do
  redirect '/pokemons'
end

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :index
end

get '/pokemons/new' do
  erb :new
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :show
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb :edit
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("#{@pokemon.id}")
end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/pokemons")
end
