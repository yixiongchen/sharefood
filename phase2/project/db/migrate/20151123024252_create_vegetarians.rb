class CreateVegetarians < ActiveRecord::Migration
  def change
    create_table :vegetarians do |t|

      t.timestamps null: false
    end
  end
end
