class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id
      t.string :genre
      t.string :name
      t.string :maker
      t.text :introduction
      t.integer :price
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
