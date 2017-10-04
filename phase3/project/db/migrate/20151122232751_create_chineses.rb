class CreateChineses < ActiveRecord::Migration
  def change
    create_table :chineses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
