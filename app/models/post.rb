class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    re = Regexp.union([
      /Won't Believe/,
      /Secret/,
      /Guess/,
      /Top \d+/
    ])
    unless record.title.to_s.match(re)
      record.errors[:title] << 'More clickbait needed'
    end
  end
end

class Post < ActiveRecord::Base
  validates_with ClickbaitValidator
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction large), message: "%{value} is not a valid category" }
end
