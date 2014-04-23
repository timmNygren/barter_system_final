class CreateBarters < ActiveRecord::Migration
  def change
    create_table :barters do |t|
      t.integer :seller
      t.string :selling
      t.integer :buyer
      t.string :offer

      t.datetime :created
      t.datetime :completed
    end
  end
end
