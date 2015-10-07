class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :twitter_account
      t.string :facebook_account

      t.timestamps null: false
    end
  end
end
