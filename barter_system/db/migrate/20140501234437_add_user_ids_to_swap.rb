class AddUserIdsToSwap < ActiveRecord::Migration
  def change
    add_column :swaps, :owner_id, :integer
    add_column :swaps, :bidder_id, :integer
  end
end
