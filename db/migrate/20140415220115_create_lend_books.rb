class CreateLendBooks < ActiveRecord::Migration
  def change
    create_table :lend_books do |t|
      t.integer :book_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
