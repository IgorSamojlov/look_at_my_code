class Syntax < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
