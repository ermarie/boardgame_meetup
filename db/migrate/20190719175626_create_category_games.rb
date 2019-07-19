class CreateCategoryGames < ActiveRecord::Migration[5.2]
  def change
    create_table :category_games do |t|
      t.references :category
      t.references :game

      t.timestamps
    end
  end
end
