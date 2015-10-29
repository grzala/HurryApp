#By Grant Christie

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.string :salt
	  t.boolean :admin,  default: false
	  
      t.timestamps null: false
    end
  end
end
