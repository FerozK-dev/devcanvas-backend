class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :about_me, :text
    add_column :users, :contact, :string
    add_column :users, :title, :string
    add_column :users, :headline, :string
    add_column :users, :github_url, :string
    add_column :users, :linked_url, :string
    add_column :users, :work_email, :string
  end
end
