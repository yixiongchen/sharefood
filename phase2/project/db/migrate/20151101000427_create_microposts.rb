class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :string
      t.text :content
      t.integer :user_id
      t.integer :status
      t.text :location
      t.text :foodtype
      t.timestamps null: false
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
