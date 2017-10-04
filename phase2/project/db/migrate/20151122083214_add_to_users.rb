class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :list_of_micropost_id, :text
  end
end
