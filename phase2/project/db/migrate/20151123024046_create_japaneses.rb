class CreateJapaneses < ActiveRecord::Migration
  def change
    create_table :japaneses do |t|

      t.timestamps null: false
    end
  end
end
