class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    @recipes.each do |x|
      name = x[:name]
    end
    erb :index
  end

  get '/recipes/new' do
    erb :recipe

  end

end
