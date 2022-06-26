class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
