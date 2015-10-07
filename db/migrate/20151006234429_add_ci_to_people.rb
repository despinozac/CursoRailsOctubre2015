class AddCiToPeople < ActiveRecord::Migration
  def change
    add_column :people, :ci, :integer
  end
end
