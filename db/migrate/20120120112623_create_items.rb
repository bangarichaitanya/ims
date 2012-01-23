class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :qty
      t.decimal :unit_price
      t.decimal :tax
      t.string :action
      t.timestamps
    end
  end
end
