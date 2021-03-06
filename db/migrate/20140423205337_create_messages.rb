class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, null: false
      t.references :recipient, null: false
      t.string :subject, null: false
      t.text :body, null: false
      t.boolean :unread, null: false, default: true

      t.timestamps
    end
  end
end
