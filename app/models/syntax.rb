class Syntax < ApplicationRecord
  has_many :codes

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
