class Code < ApplicationRecord
  DURATION = {
    '1day' => 1.day,
    '1week' => 1.week,
    '1month' => 1.month,
    '1year' => 1.year,
  }

  belongs_to :syntax

  has_many :comments, inverse_of: :code

  before_validation :set_data, on: :create
  before_save :set_formatted_code

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

  def get_comments
    comments.order(:created_at).group_by(&:line)
  end

  def self.active(permalink)
    self.where('expired_at > NOW()').find_by_permalink!(permalink)
  end

  private

  def set_formatted_code
    self.formatted_code = CodeRay.scan(code, syntax.lang).html(css: :class)
  end

  def set_data
    self.permalink = Digest::SHA256.hexdigest("#{code}#{SecureRandom.hex(50)}").to_i(16).to_s(36)
  end
end

