class CreateFrenches < ActiveRecord::Migration
  def change
    create_table :frenches do |t|

      t.timestamps null: false
    end
  end
end
