class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.string :extractdate
      t.string :organisationlabel
      t.string :locationtext
      t.string :coordinatereferencesystem, :default => "WGS84"
      t.float :geox
      t.float :geoy
      t.string :category, :default => "Unknown"
      t.string :babychange, :default => "Unknown"
      t.string :familytoilet, :default => "Unknown"
      t.string :changingplace, :default => "Unknown"
      t.string :fulltimestaffing, :default => "Unknown"
      t.string :chargeamount, :default => "Unknown"
      t.string :openinghours, :default => "Unknown"
      t.string :managedby, :default => "Unknown"
      t.string :reportemail
      t.string :reporttel
      t.string :postcode
      t.string :streetaddress

      t.timestamps null: false
    end
  end
end
