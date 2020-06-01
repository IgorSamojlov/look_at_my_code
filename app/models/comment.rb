class Comment < ApplicationRecord
  belongs_to :code, inverse_of: :comments

  with_options presence: true do
    validates :comment, allow_blank: false
    validates :line
  end
end
