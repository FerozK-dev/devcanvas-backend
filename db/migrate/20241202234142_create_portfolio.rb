class CreatePortfolio < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.references :user
      t.timestamps
    end
  end
end
