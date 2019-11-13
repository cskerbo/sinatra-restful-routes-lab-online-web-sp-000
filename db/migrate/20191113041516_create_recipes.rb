class CreateRecipes < ActiveRecord::Migration
  def change
    creat_table :recipes do |x|
      x.string :name
      x.string :ingredients
      x.string :cook_time
    end
  end
end
