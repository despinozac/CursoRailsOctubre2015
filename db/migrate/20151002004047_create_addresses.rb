class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :country
      t.integer :zipcode
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
