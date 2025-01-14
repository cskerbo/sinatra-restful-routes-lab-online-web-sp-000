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

    erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'
  end
end
