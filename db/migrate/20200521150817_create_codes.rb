class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.string :title
      t.string :author
      t.string :permalink, null: false
      t.text :code, null: false
      t.references :syntax, null: false, foreign_key: true
      t.datetime :expired_at, null: false

      t.index :permalink, unique: true
      t.timestamps
    end
  end
end
