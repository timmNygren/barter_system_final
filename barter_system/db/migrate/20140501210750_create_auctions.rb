class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :auction_name
      t.string :auction_description
      t.integer :user_id
      t.boolean :available

      t.timestamps
    end
  end
end
