class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.integer :aution_id
      t.integer :offer_id
      t.string :state

      t.timestamps
    end
  end
end
