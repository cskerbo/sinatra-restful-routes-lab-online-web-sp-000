class CreateRecipes < ActiveRecord::Migration
  def change
    creat_table :recipes do |x|
      x.string :name
      x.string :ingredients
    end
  end
end
