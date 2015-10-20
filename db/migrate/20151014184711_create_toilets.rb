class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.string :extractdate
      t.string :organisationlabel
      t.string :locationtext
      t.string :coordinatereferencesystem, :default => "WGS84"
      t.float :geox
      t.float :geoy
      t.string :category
      t.string :babychange
      t.string :familytoilet
      t.string :changingplace
      t.string :fulltimestaffing
      t.string :chargeamount
      t.string :openinghours
      t.string :managedby
      t.string :reportemail
      t.string :reporttel
      t.string :postcode
      t.string :streetaddress
      t.string :radarkeyneeded 

      t.timestamps null: false
    end
  end
end
