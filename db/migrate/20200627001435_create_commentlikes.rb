class CreateCommentlikes < ActiveRecord::Migration[5.0]
  def change
    create_table :commentlikes do |t|
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
