class CreateCommentLines < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.integer :line, null: false
      t.string :author

      t.references :code, foreign_key: true
      t.timestamps
    end
  end
end
