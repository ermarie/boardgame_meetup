class CreateGameUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_users do |t|
      t.references :game
      t.references :user
      t.integer :times_played
      t.timestamps
    end
  end
end
