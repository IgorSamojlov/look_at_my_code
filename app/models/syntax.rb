# frozen_string_literal: true

class Syntax < ApplicationRecord
  has_many :codes

  validates :name, presence: true, uniqueness: true
  validates :lang, presence: true, uniqueness: true

  def to_s
    name
  end
end
