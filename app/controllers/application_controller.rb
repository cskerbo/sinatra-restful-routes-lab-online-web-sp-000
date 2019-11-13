class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    new_recipe = Recipe.create(params)
    new_recipe.save
    redirect ("/recipes/#{Recipe.last.id}")
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :
end
