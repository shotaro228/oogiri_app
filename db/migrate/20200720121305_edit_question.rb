class EditQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :today_flg, :boolean, default: false, :null => false
  end
end
