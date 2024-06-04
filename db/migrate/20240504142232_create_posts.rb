class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :live
      t.string :name
      t.string :adress
      t.integer :time
      t.integer :fee
      t.string :staytime
      t.string :roof

      t.timestamps
    end
  end
end
