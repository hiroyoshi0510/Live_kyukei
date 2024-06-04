class AddComment2ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comment2, :text
  end
end
