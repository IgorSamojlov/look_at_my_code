class AddFormattedCodeToCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :formatted_code, :string
  end
end
