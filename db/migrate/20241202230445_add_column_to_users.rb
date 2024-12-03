class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :publish_portfolio, :boolean
  end
end
