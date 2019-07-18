class CreateJoinTableGameMechanism < ActiveRecord::Migration[5.2]
  def change
    create_join_table :games, :mechanisms do |t|
      # t.index [:game_id, :mechanism_id]
      # t.index [:mechanism_id, :game_id]
    end
  end
end
