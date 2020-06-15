class User < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password, :string
    add_column :users, :introduction, :text
    add_column :users, :image_name, :string
  end
end
