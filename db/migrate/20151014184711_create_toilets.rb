class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.float :x
      t.float :y
      t.string :objectId
      t.string :extractDate
      t.string :organisationUrl
      t.string :organisationLabel
      t.string :serviceTypeUrl
      t.string :serviceTypeLabel
      t.string :coordinateReferenceSystem
      t.string :locationText
      t.float :geoX
      t.float :geoY
      t.string :geoPointLicensingUrl
      t.string :category
      t.string :accesibleCategory
      t.string :radarKeyNeeded
      t.string :babyChange
      t.string :familyToilet
      t.string :changingPlace
      t.string :automaticPublicConvenience
      t.string :fullTimeStaffing
      t.string :partOfCommunityScheme
      t.string :communitySchemeName
      t.string :chargeAmount
      t.string :infoUrl
      t.string :openingHours
      t.string :managedBy
      t.string :reportEmail
      t.string :reportTel
      t.string :notes
      t.string :uprn
      t.string :postCode
      t.string :streetAddress
      t.string :geoAreaUrl
      t.string :geoAreaLabel

      t.timestamps null: false
    end
  end
end
