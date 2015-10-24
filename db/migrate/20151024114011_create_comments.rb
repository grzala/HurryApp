class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :belongs_to
      t.integer :toilet_id
      t.string :has_one
      t.integer :user_id
      t.string :message
      t.datetime :date

      t.timestamps null: false
    end
  end
end
