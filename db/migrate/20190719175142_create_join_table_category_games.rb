class CreateJoinTableCategoryGames < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :games do |t|
      # t.index [:category_id, :game_id]
      # t.index [:game_id, :category_id]
    end
  end
end
