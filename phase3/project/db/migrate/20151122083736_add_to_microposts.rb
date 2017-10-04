class AddToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :list_of_user_id, :text
  end
end
