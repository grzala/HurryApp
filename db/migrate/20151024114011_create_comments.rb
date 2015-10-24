class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :toilet_id
      t.integer :user_id
      t.string :message
      t.datetime :date

      t.timestamps null: false
    end
  end
end
