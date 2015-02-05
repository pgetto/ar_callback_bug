class CreateTens < ActiveRecord::Migration
  def change
    create_table :tens do |t|
      t.references :jack, index: true

      t.timestamps null: false
    end
    add_foreign_key :tens, :jacks
  end
end
