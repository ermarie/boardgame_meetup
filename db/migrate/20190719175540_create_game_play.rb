class CreateGamePlay < ActiveRecord::Migration[5.2]
  def change
    create_table :game_play do |t|
      t.references :game
      t.references :user
      t.integer :times_played
      t.integer :minutes_played
      t.string :players
      t.string :winner

      t.timestamps
    end
  end
end
