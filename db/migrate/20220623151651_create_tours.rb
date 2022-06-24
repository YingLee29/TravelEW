class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :destination
      t.integer :tourday
      t.integer :price
      t.datetime :starday
      t.integer :rated

      t.timestamps
      
    end
  end
end
