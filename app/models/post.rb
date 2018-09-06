class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  CLICKBAIT_TAGS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait?
    if CLICKBAIT_TAGS.none? {|tag| tag.match title}
      errors.add(:title, 'must contain clickbait tag')
    end
  end
end
