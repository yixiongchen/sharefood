class CreateCanadianposts < ActiveRecord::Migration
  def change
    create_table :canadianposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :status
      t.string :location
      t.string :foodtype
      t.string :picture
      t.string :list_of_user_id

      t.timestamps null: false
    end
  end
end
