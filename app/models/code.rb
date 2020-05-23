class Code < ApplicationRecord
  DURATION = {
      '1min' => 1.minute,
      '1day' => 1.day,
      '1week' => 1.week,
      '1month' => 1.month,
      '1year' => 1.year,
    }

  belongs_to :syntax

  before_validation :set_data, on: :create

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

  private

  def set_data
    self.expired_at = DateTime.now + DURATION[expires]
    self.permalink = Digest::SHA256.hexdigest("#{code}#{SecureRandom.hex(50)}").to_i(16).to_s(36)
  end
end

