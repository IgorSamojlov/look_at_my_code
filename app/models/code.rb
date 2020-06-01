class Code < ApplicationRecord
  DURATION = {
    '1day' => 1.day,
    '1week' => 1.week,
    '1month' => 1.month,
    '1year' => 1.year,
  }

  belongs_to :syntax

  has_many :comments, inverse_of: :code

  before_validation :set_data, :set_formatted_code, on: :create

  attribute :expires, :string

  with_options presence: true do
    validates :permalink, uniqueness: true
    validates :code
    validates :expired_at
    validates :expires
  end

  def set_formatted_code
    self.formatted_code = CodeRay.scan(code, syntax.lang).html(css: :class)
  end

  def to_param
    permalink
  end

  def get_comments
    result = {}
    comments.each do |comment|
      if result[comment.line]
        result[comment.line].push comment_to_hash comment
      else
        result[comment.line] = [comment_to_hash(comment)]
      end
    end
    result
  end

  private

  def comment_to_hash(comment)
    {
      comment: comment.comment,
      date: comment.created_at,
      author: comment.author,
    }
  end

  def set_data
    self.permalink = Digest::SHA256.hexdigest("#{code}#{SecureRandom.hex(50)}").to_i(16).to_s(36)
  end
end

