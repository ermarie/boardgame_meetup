class CreateCategoryGames < ActiveRecord::Migration[5.2]
  def change
    create_table :category_games do |t|
      t.string :category
      t.string :reference
      t.reference :game

      t.timestamps
    end
  end
end
