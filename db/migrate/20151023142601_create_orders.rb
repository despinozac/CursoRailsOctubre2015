class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :person
      t.references :company
      t.string :description
      t.date :date
      t.timestamps null: false
    end
  end
end
