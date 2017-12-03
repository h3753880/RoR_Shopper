class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :description
      t.integer :price1
      t.integer :price2

      t.timestamps
    end
  end
end
