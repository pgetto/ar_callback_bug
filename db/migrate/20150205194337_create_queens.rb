class CreateQueens < ActiveRecord::Migration
  def change
    create_table :queens do |t|
      t.references :king, index: true

      t.timestamps null: false
    end
    add_foreign_key :queens, :kings
  end
end
