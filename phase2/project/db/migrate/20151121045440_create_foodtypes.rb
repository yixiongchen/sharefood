class CreateFoodtypes < ActiveRecord::Migration
  def change
    create_table :foodtypes do |t|
      t.string :region
      t.string :cuisine

      t.timestamps null: false
    end
  end
end
