class AddReservedIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :reserved_id, :integer
  end
end
