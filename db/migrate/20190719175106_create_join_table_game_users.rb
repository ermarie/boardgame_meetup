class CreateJoinTableGameUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :games, :users do |t|
      # t.index [:game_id, :user_id]
      # t.index [:user_id, :game_id]
    end
  end
end
