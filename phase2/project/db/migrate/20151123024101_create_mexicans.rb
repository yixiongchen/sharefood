class CreateMexicans < ActiveRecord::Migration
  def change
    create_table :mexicans do |t|

      t.timestamps null: false
    end
  end
end
