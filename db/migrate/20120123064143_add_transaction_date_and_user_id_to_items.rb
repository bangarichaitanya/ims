class AddTransactionDateAndUserIdToItems < ActiveRecord::Migration
  def change
     add_column :items, :user_id, :integer
     add_column :items, :transaction_date, :datetime
  end
end
