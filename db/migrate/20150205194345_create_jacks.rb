class CreateJacks < ActiveRecord::Migration
  def change
    create_table :jacks do |t|
      t.references :queen, index: true

      t.timestamps null: false
    end
    add_foreign_key :jacks, :queens
  end
end
