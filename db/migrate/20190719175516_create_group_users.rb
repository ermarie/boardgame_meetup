class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.reference :group
      t.reference :user

      t.timestamps
    end
  end
end
