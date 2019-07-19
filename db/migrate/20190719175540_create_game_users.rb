class CreateGameUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_users do |t|
      t.reference :game
      t.reference :user

      t.timestamps
    end
  end
end
