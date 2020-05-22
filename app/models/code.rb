class Code < ApplicationRecord
  belongs_to :syntax

  attribute :expires, :string

  with_options presence: true do
    validates :permalink, uniqueness: true
    validates :code
    validates :expired_at
    validates :expires
  end

  def to_param
    permalink
  end

  def duration_data
    {
      '1min' => 1.minute,
      '1day' => 1.day,
      '1week' => 1.week,
      '1month' => 1.month,
      '1year' => 1.year,
    }
  end
end
