class AddPersonToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :person, index: true, foreign_key: true
  end
end
