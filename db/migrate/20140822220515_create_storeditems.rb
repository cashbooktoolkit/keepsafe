class CreateStoreditems < ActiveRecord::Migration
  def change
    create_table :storeditems do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
