class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.boolean :available, default: true

      t.timestamps
    end

    # Add a unique index to the ISBN field
    add_index :books, :isbn, unique: true
  end
end
