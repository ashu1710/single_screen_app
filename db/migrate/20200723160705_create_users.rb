class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :state
      t.string :area
      t.integer :pincode
      t.text :address

      t.timestamps
    end
  end
end
