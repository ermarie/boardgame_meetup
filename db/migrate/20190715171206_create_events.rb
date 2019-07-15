class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_time
      t.integer :group_id

      t.timestamps
    end
  end
end
