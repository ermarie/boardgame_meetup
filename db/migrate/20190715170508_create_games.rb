class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_play_time
      t.integer :max_play_time
      t.integer :min_num_players
      t.integer :max_num_players
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
