class AddConstraintToFormattedCode < ActiveRecord::Migration[6.0]
  def change
    change_column_null :codes, :formatted_code, false
  end
end
