class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/recipes/new' do
    erb :recipe

  end

  post '/recipes' do
    new_recipe = Recipe.create(params)
    new_recipe.save
    redirect ("/recipes/#{Recipe.last.id}")
  end

  get '/recipes' do
    @recipes = Recipe.all
    @recipes.each do |x|
      name = x[:name]
    end
    erb :index
  end

end
